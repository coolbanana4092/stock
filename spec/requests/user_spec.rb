require 'rails_helper'

RSpec.describe "User pages", type: :request do
  let(:other_user) { FactoryBot.create(:user, id: 2, name: "other_user_name", email: "other_user_name@gmail.com", password: "eni38g9sw") }
  let(:user_params) { FactoryBot.attributes_for(:user, name: "NewName") }

  describe "#edit" do
    # ログインしていて、かつ、編集対象のユーザーとログインしているユーザーが同じ場合
    context "as an authorized user" do
      # ユーザー情報変更画面へ遷移すること
      it "responds successfully" do
        sign_in_as user
        get edit_user_path(user)
        expect(response).to be_success
        expect(response).to have_http_status "200"
      end
    end

    # ユーザーがログインしていない場合
    context "as a guest" do
      # ログイン画面に遷移すること
      it "redirects to the login page" do
        get edit_user_path(user)
        expect(response).to have_http_status "302"
        expect(response).to redirect_to login_url
      end
    end

    # 編集対象のユーザーとログインしているユーザーが異なる場合
    context "as other user" do
      # トップページに遷移すること
      it "redirects to the toppage" do
        sign_in_as other_user
        get edit_user_path(user)
        expect(response).to redirect_to root_url
      end
    end
  end

  describe "#update" do
    # ログインしていて、かつ、編集対象のユーザーとログインしているユーザーが同じ場合
    context "as an authorized user" do
      # ユーザーを更新できること
      it "updates a user" do
        sign_in_as user
        patch user_path(user), params: { id: user.id, user: user_params }
        expect(user.reload.name).to eq "NewName"
        expect(flash[:success]).to match("ユーザー情報を編集しました")
      end
    end

    # ユーザーがログインしていない場合
    context "as a guest" do
      # ログイン画面に遷移すること
      it "redirects to the login page" do
        patch user_path(user), params: { id: user.id, user: user_params }
        expect(response).to have_http_status "302"
        expect(response).to redirect_to login_url
      end
    end

    # 編集対象のユーザーとログインしているユーザーが異なる場合
    context "as other user" do
      # ユーザー情報を更新できずに、トップページへ遷移すること
      it "can't update the user information" do
        sign_in_as other_user
        patch user_path(user), params: { id: user.id, user: user_params }
        expect(user.reload.name).to_not eq "NewName"
        expect(response).to redirect_to root_url
      end
    end
  end
end
