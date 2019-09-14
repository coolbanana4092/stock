require 'rails_helper'

RSpec.describe "Remember me", type: :request do
  context "log out with multiple tabs" do
    it "logs in with valid information followed by logout" do
      get login_path
      post login_path, params: { session: { email: user.email, password: user.password } }
      expect(response).to redirect_to root_url
      expect(flash[:success]).to match("ログインに成功しました")

      delete logout_path
      expect(response).to redirect_to root_url
      expect(flash[:success]).to match("ログアウトしました")
      expect(session[:user_id]).to eq nil

      delete logout_path
      expect(response).to redirect_to root_url
      expect(session[:user_id]).to eq nil
      expect(flash[:success]).to match("ログアウトしました")
    end
  end

  context "login with remembering" do
    it "remembers cookies" do
      post login_path, params: { session: { email: user.email, password: user.password, remember_me: '1'} }
      expect(response).to redirect_to root_url
      expect(response.cookies['remember_token']).to_not eq nil
      expect(flash[:success]).to match("ログインに成功しました")
    end
  end

  context "login without remembering" do
    it "doesn't remember cookies"do
      post login_path, params: { session: { email: user.email, password: user.password, remember_me: '1'} }

      delete logout_path

      post login_path, params: { session: { email: user.email, password: user.password, remember_me: '0'} }
      expect(response.cookies['remember_token']).to eq nil
      expect(flash[:success]).to match("ログインに成功しました")
    end
  end
end
