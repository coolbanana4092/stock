require 'rails_helper'

RSpec.describe "Remember me", type: :request do
  let(:user) { FactoryBot.create(:user) }

  # remember me 機能における2つのバグのテスト1
  context "with valid information" do
    # ログイン中のみログアウトすること
    it "logs in with valid information followed by logout" do
      get login_path
      post login_path, params: { session: { email: user.email,
                                         password: user.password } }
      expect(response).to redirect_to root_url

      # ログアウトする
      delete logout_path
      expect(response).to redirect_to root_url
      expect(session[:user_id]).to eq nil

      # 2番目のウィンドウでログアウトする
      delete logout_path
      expect(response).to redirect_to root_url
      expect(session[:user_id]).to eq nil
    end
  end

  # remember me 機能を利用した場合のテスト
  context "login with remembering" do
    it "remembers cookies" do
      post login_path, params: { session: { email: user.email,
                                      password: user.password,
                                      remember_me: '1'} }
      expect(response.cookies['remember_token']).to_not eq nil
    end
  end

  # remember me 機能を利用しない場合のテスト
  context "login without remembering" do
    it "doesn't remember cookies"do
      # クッキーを保存してログインした後にログアウトをする
      post login_path, params: { session: { email: user.email,
                                      password: user.password,
                                      remember_me: '1'} }
      delete logout_path

      # その後、クッキーを保存せずにログインする
      post login_path, params: { session: { email: user.email,
                                      password: user.password,
                                      remember_me: '0'} }
      expect(response.cookies['remember_token']).to eq nil
    end
  end
end
