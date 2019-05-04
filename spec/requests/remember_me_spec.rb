require 'rails_helper'

RSpec.describe "Remember me", type: :request do
  # remember me 機能におけるバグのテスト
  # ログイン後に複数のタブを開き、それぞれでログアウトする場合のテスト
  context "log out with multiple tabs" do
    # ログイン中のみログアウトすること
    it "logs in with valid information followed by logout" do
      # ログインする
      get login_path
      post login_path, params: { session: { email: user.email, password: user.password } }
      expect(response).to redirect_to root_url
      expect(flash[:success]).to match("ログインに成功しました")

      # 1つ目のウィンドウでログアウトする
      delete logout_path
      expect(response).to redirect_to root_url
      expect(flash[:success]).to match("ログアウトしました")
      expect(session[:user_id]).to eq nil

      # 2つ目のウィンドウでログアウトする
      delete logout_path
      expect(response).to redirect_to root_url
      expect(session[:user_id]).to eq nil
      expect(flash[:success]).to match("ログアウトしました")
    end
  end

  # remember me 機能を利用した場合のログインのテスト
  context "login with remembering" do
    # クッキーを保存してログインに成功する
    it "remembers cookies" do
      post login_path, params: { session: { email: user.email, password: user.password, remember_me: '1'} }
      expect(response).to redirect_to root_url
      expect(response.cookies['remember_token']).to_not eq nil
      expect(flash[:success]).to match("ログインに成功しました")
    end
  end

  # remember me 機能を利用しない場合のログインのテスト
  context "login without remembering" do
    # クッキーを保存せずにログインに成功する
    it "doesn't remember cookies"do
      # まずは、クッキーを保存してログインする
      post login_path, params: { session: { email: user.email, password: user.password, remember_me: '1'} }

      # 次に、ログアウトする
      delete logout_path

      # その後、クッキーを保存せずにログインする
      post login_path, params: { session: { email: user.email, password: user.password, remember_me: '0'} }
      expect(response.cookies['remember_token']).to eq nil
      expect(flash[:success]).to match("ログインに成功しました")
    end
  end
end
