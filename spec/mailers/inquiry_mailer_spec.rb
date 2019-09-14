require "rails_helper"

RSpec.describe InquiryMailer, type: :mailer do
  let(:inquiry) { FactoryBot.create(:inquiry) }
  let(:mail) { InquiryMailer.send_email(inquiry) }

  context "inquiry" do
    it "renders the headers" do
      expect(mail.to).to eq ["fukaya@gmail.com"]
      expect(mail.from).to eq ["sc0085hx@ed.ritsumei.ac.jp"]
      expect(mail.subject).to eq "お問い合わせ通知"
    end

    # it "renders the body" do
    #   expect(mail.body).to match inquiry.name
    #   expect(mail.body).to match inquiry.email
    #   expect(mail.body).to match inquiry.message
    # end
  end
end
