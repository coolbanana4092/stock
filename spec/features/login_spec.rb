require 'rails_helper'

RSpec.feature "Login", type: :feature do
  context "login" do
    it "user successfully logins" do
      visit root_path
      click_link "ログイン"
      fill_in "メールアドレス", with: user.email
      fill_in "パスワード",     with: user.password
      click_button "ログイン"

      expect(current_path).to eq root_path
      expect(page).to_not have_content "メールアドレス"
      expect(page).to_not have_content "パスワード"
    end

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
    it "user successfully logouts" do

      visit root_path
      click_link "ログイン"
      fill_in "メールアドレス", with: user.email
      fill_in "パスワード",     with: user.password
      click_button "ログイン"

      expect(current_path).to eq root_path
      expect(page).to_not have_content "メールアドレス"
      expect(page).to_not have_content "パスワード"

      click_link "ログアウト"

      expect(current_path).to eq root_path
      expect(page).to have_content "ログイン"
    end
  end
end
