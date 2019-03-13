# Preview all emails at http://localhost:3000/rails/mailers/inquiry
class InquiryPreview < ActionMailer::Preview
  # Preview all emails at http://localhost:3000/rails/mailers/inquiry/inquiry
  def inquiry
    inquiry = Inquiry.new(name: "m-fukaya", email: "m-fukaya@gmail.com", message: "バグが発生しています。")

    InquiryMailer.send_email(inquiry)
  end
end
