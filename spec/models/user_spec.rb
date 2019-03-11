require 'rails_helper'

RSpec.describe User, type: :model do
  context "validation" do
    # 名前、メールアドレス、パスワードがあれば有効であること
    it "is valid with a name, email, and password" do
      expect(user).to be_valid
    end

    # 名前がなければ無効であること
    it "is invalid without a name" do
      user = FactoryBot.build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    # メールアドレスがなければ無効であること
    it "is invalid without an email address" do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # メールアドレスの形式でなければ無効であること
    it "is invalid without mail address format" do
      user = FactoryBot.build(:user, email: "m-fukaya-com")
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end

    # 重複したメールアドレスなら無効であること
    it "is invalid with a duplicate email address" do
      FactoryBot.create(:user, email: "m-fukaya@gmail.com")
      user = FactoryBot.build(:user, email: "m-fukaya@gmail.com")
      user.valid?
      expect(user.errors[:email]).to include("has already been taken")
    end
  end

  # remember me 機能における2つのバグのテスト2 -remember_digest が存在しない場合の authenticated?メソッド のテスト-
  context "authenticated? should return false for a user with nil digest" do
    # remember_digest が存在しなければ authenticated?メソッド は無効であること
    it "is invalid without remember_digest" do
      expect(user.authenticated?(:remember, '')).to eq false
    end
  end
end
