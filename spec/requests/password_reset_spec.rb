require 'rails_helper'

RSpec.describe "User pages", type: :request do
  let(:user) { FactoryBot.create(:user) }

  it "resets password" do
    # メール送信のテスト
    # 無効な(データベースに登録されていない)メールアドレスを送信
    post password_resets_path, params: { password_reset: { email: "" } }
    expect(response).to redirect_to new_password_reset_url

    # 有効な(データベースに登録されている)メールアドレスを送信
    post password_resets_path, params: { password_reset: { email: user.email }}
    expect(response).to redirect_to root_url


    # パスワード再設定フォームへのアクセスのテスト
    user = assigns(:user)

    # メールアドレスが無効で、トークンが有効
    get edit_password_reset_path(user.reset_token, email: "" )
    expect(response).to redirect_to root_url

    # メールアドレスが有効で、トークンが無効
    get edit_password_reset_path('wrong token', email: user.email )
    expect(response).to redirect_to root_url

    # メールアドレスもトークンも有効
    get edit_password_reset_path(user.reset_token, email: user.email )
    expect(response).to render_template(:edit)


    # パスワード再設定のテスト
    # パスワードとパスワード確認が異なる
    patch password_reset_path(user.reset_token),
      params: { email: user.email, user: { password: "hoge", password_confirmation: "foo" } }
    expect(response).to redirect_to edit_password_reset_url

    # パスワードが空である
    patch password_reset_path(user.reset_token),
      params: { email: user.email, user: { password: "", password_confirmation: "" } }
    expect(response).to redirect_to edit_password_reset_url

    # 有効なパスワードとパスワード確認
    patch password_reset_path(user.reset_token),
        params: { email: user.email, user: { password: "valid", password_confirmation: "valid" } }
    expect(session[:user_id]).to eq user.id
    expect(response).to redirect_to root_url
  end
end
