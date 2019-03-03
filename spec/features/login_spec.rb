require 'rails_helper'

RSpec.feature "Login", type: :feature do
  let(:user) { FactoryBot.create(:user) }

  # ユーザーがログインに成功する
  scenario "user successfully login" do
    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"

    expect(current_path).to eq root_path
    expect(page).to_not have_content "メールアドレス"
    expect(page).to_not have_content "パスワード"
  end

  # 無効な情報ではログインに失敗する
  scenario "user doesn't login with invalid information" do
    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: ""
    fill_in "パスワード", with: ""
    click_button "ログイン"

    expect(current_path).to eq login_path
    expect(page).to have_content "メールアドレス"
    expect(page).to have_content "パスワード"
  end

  # ログアウトすること
  scenario "user successfully login" do

    # ログインする
    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"

    expect(current_path).to eq root_path
    expect(page).to_not have_content "メールアドレス"
    expect(page).to_not have_content "パスワード"

    # ログアウトする
    click_link "ログアウト"

    expect(current_path).to eq root_path
    expect(page).to have_content "ログイン"
  end
end
