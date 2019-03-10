class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  include SessionsHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      remember(@user)
      redirect_to root_url
    else
      redirect_to signup_url
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      flash[:success] = "ユーザー情報を編集しました。"
      redirect_to root_url
    else
      redirect_to edit_user_url(current_user)
    end
  end

  private

    def logged_in_user
      unless logged_in?
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
