require 'rails_helper'

RSpec.feature "SignUps", type: :feature do

  # ユーザーは新規登録に成功する
  scenario "user successfully signs up" do
    visit root_path
    click_link "新規登録"

    expect {
      fill_in "ユーザー名",        with: "m-fukaya"
      fill_in "メールアドレス",    with: "test@example.com"
      fill_in "パスワード",        with: "password"
      fill_in "パスワード (確認)", with: "password"
      
      click_button "新規登録"
    }.to change(User, :count).by(1)
  end
end
