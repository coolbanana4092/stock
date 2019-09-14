require 'rails_helper'

RSpec.describe User, type: :model do
  context "validation" do
    it "is valid with a name, email, and password" do
      expect(user).to be_valid
    end

    it "is invalid without a name" do
      user = FactoryBot.build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "is invalid without an email address" do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "is invalid without mail address format" do
      user = FactoryBot.build(:user, email: "m-fukaya-com")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "is invalid with a duplicate email address" do
      FactoryBot.create(:user, email: "m-fukaya@gmail.com")
      user = FactoryBot.build(:user, email: "m-fukaya@gmail.com")
      user.valid?
      expect(user.errors[:email]).to include("はすでに存在します")
    end
  end

  context "authenticated? should return false for a user with nil digest" do
    it "is invalid without remember_digest" do
      expect(user.authenticated?(:remember, '')).to eq false
    end
  end
end
