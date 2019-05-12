require 'rails_helper'

RSpec.feature "Login", type: :feature do
  context "login" do
    # ログインに成功する
    it "user successfully logins" do
      visit root_path
      click_link "ログイン"
      fill_in "メールアドレス", with: user.email
      fill_in "パスワード",     with: user.password
      click_button "ログイン"

      expect(current_path).to eq events_path
      expect(page).to_not have_content "メールアドレス"
      expect(page).to_not have_content "パスワード"
    end

    # メールアドレスがなければログインに失敗する
    it "user doesn't login with invalid information" do
      visit root_path
      click_link "ログイン"
      fill_in "メールアドレス", with: ""
      fill_in "パスワード",     with: user.password
      click_button "ログイン"

      expect(current_path).to eq login_path
      expect(page).to have_content "メールアドレス"
      expect(page).to have_content "パスワード"
    end

    # パスワードがなければログインに失敗する
    it "user doesn't login with invalid information" do
      visit root_path
      click_link "ログイン"
      fill_in "メールアドレス", with: user.email
      fill_in "パスワード",     with: ""
      click_button "ログイン"

      expect(current_path).to eq login_path
      expect(page).to have_content "メールアドレス"
      expect(page).to have_content "パスワード"
    end
  end

  context "logout" do
    # ログアウトに成功する
    it "user successfully logouts" do

      # ログインする
      visit root_path
      click_link "ログイン"
      fill_in "メールアドレス", with: user.email
      fill_in "パスワード",     with: user.password
      click_button "ログイン"

      expect(current_path).to eq events_path
      expect(page).to_not have_content "メールアドレス"
      expect(page).to_not have_content "パスワード"

      # ログアウトする
      click_link "ログアウト"

      expect(current_path).to eq root_path
      expect(page).to have_content "ログイン"
    end
  end
end
