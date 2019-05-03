class PasswordResetsController < ApplicationController
  before_action :get_user,   only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:success] = "パスワードを変更するためのメールが送信されました。"
      redirect_to root_url
    else
      flash[:negative] = "パスワードを変更するためのメールの送信は失敗しました。"
      redirect_to new_password_reset_url
    end
  end

  def edit
  end

  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, :blank)
      flash[:negative] = "パスワードの変更に失敗しました。"
      flash[:error] = @user.errors.full_messages
      redirect_to edit_password_reset_url
    elsif @user.update_attributes(user_params)
      session[:user_id] = @user.id
      flash[:success] = "パスワードを変更しました。"
      redirect_to root_url
    else
      flash[:negative] = "パスワードの変更に失敗しました。"
      flash[:error] = @user.errors.full_messages
      redirect_to edit_password_reset_url
    end
  end

  private
  
    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    def get_user
      @user = User.find_by(email: params[:email])
    end

    def valid_user
      unless (@user && @user.authenticated?(:reset, params[:id]))
        redirect_to root_url
      end
    end

    def check_expiration
      if @user.password_reset_expired?
        flash[:negative] = "Password reset has expired."
        redirect_to new_password_reset_url
      end
    end
end
