class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]

    if login(email, password)
      redirect_to root_url
    else
      render :new
    end
  end

  def destroy
    if logged_in?
      forget(current_user)
      session[:user_id] = nil
      @current_user = nil
      redirect_to root_url
    end
  end

  private

    def login(email, password)
      @user = User.find_by(email: email)

      if @user && @user.authenticate(password)
        session[:user_id] = @user.id
        remember(@user)
        return true
      else
        return false
      end
    end
end
