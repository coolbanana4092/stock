require 'rails_helper'

RSpec.describe "User pages", type: :request do
  let(:user) { FactoryBot.create(:user) }

  it "resets password" do
    post password_resets_path, params: { password_reset: { email: "" } }
    expect(response).to redirect_to new_password_reset_url
    expect(flash[:negative]).to match("パスワードを変更するためのメールの送信は失敗しました")

    post password_resets_path, params: { password_reset: { email: user.email }}
    expect(response).to redirect_to root_url
    expect(flash[:success]).to match("パスワードを変更するためのメールが送信されました")


    user = assigns(:user)

    get edit_password_reset_path(user.reset_token, email: "" )
    expect(response).to redirect_to root_url

    get edit_password_reset_path('wrong token', email: user.email )
    expect(response).to redirect_to root_url

    get edit_password_reset_path(user.reset_token, email: user.email )
    expect(response).to render_template(:edit)


    patch password_reset_path(user.reset_token),
      params: { email: user.email, user: { password: "hoge", password_confirmation: "foo" } }
    expect(response).to redirect_to edit_password_reset_url
    expect(flash[:negative]).to match("パスワードの変更に失敗しました")

    patch password_reset_path(user.reset_token),
      params: { email: user.email, user: { password: "", password_confirmation: "" } }
    expect(response).to redirect_to edit_password_reset_url
    expect(flash[:negative]).to match("パスワードの変更に失敗しました")

    patch password_reset_path(user.reset_token),
        params: { email: user.email, user: { password: "valid", password_confirmation: "valid" } }
    expect(session[:user_id]).to eq user.id
    expect(response).to redirect_to root_url
    expect(flash[:success]).to match("パスワードを変更しました")
  end
end
