class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]

    if login(email, password)
      flash[:success] = "ログインに成功しました。"
      redirect_to root_url
    else
      flash.now[:negative] = "ログインに失敗しました。"
      render :new
    end
  end

  def destroy
    if logged_in?
      forget(current_user)
      session[:user_id] = nil
      @current_user = nil
    end
    
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end

  private

    def login(email, password)
      @user = User.find_by(email: email)

      if @user && @user.authenticate(password)
        session[:user_id] = @user.id
        params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
        return true
      else
        return false
      end
    end
end
