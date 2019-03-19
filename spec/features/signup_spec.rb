require 'rails_helper'

RSpec.feature "SignUp", type: :feature do
  context "sign up" do
    # 新規登録に成功する
    it "user successfully signs up" do
      visit root_path
      click_link "新規登録"

      expect {
        fill_in "ユーザー名",        with: "m-fukaya"
        fill_in "メールアドレス",    with: "m-fukaya@gmail.com"
        fill_in "パスワード",        with: "password"
        fill_in "パスワード (確認)", with: "password"

        click_button "新規登録"
      }.to change(User, :count).by(1)

      expect(current_path).to eq root_path
    end

    # 新規登録に失敗する
    it "user fails to sign up" do
      visit root_path
      click_link "新規登録"

      expect {
        fill_in "ユーザー名",        with: "m-fukaya"
        fill_in "メールアドレス",    with: ""
        fill_in "パスワード",        with: ""
        fill_in "パスワード (確認)", with: ""

        click_button "新規登録"
      }.to change(User, :count).by(0)

      expect(current_path).to eq signup_path
    end
  end
end
