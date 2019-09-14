require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  let(:mail) { UserMailer.password_reset(user) }

  context "password_reset" do
    it "renders the headers" do
      user.reset_token = User.new_token
      expect(mail.to).to eq ["m-fukaya@gmail.com"]
      expect(mail.from).to eq ["sc0085hx@ed.ritsumei.ac.jp"]
      expect(mail.subject).to eq "パスワードの再設定"
    end

    it "renders the body" do
      user.reset_token = User.new_token
      expect(mail.body.encoded).to match user.reset_token
      expect(mail.body.encoded).to match CGI.escape(user.email)
    end
  end
end
