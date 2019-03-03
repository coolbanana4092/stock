require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  let(:user) { FactoryBot.create(:user) }

  describe "password_reset" do
    let(:mail) { UserMailer.password_reset(user) }

    # メール送信のテスト
    it "renders the headers" do
      user.reset_token = User.new_token
      expect(mail.to).to eq ["m-fukaya@gmail.com"]
      expect(mail.from).to eq ["from@example.com"]
      expect(mail.subject).to eq "Password reset"
    end

    # メールプレビューのテスト
    it "renders the body" do
      user.reset_token = User.new_token
      expect(mail.body.encoded).to match user.reset_token
      expect(mail.body.encoded).to match CGI.escape(user.email)
    end
  end
end
