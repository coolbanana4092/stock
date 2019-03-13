# Preview all emails at http://localhost:3000/rails/mailers/inquiry
class InquiryPreview < ActionMailer::Preview
  def inquiry
    inquiry = Inquiry.new(name: "m-fukaya", message: "バグが発生しています。")

    InquiryMailer.send_email(inquiry)
  end
end
