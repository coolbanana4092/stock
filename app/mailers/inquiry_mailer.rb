class InquiryMailer < ApplicationMailer
  def send_email(inquiry)
    @inquiry = inquiry

    mail(
      from:    'from@example.com',
      to:       inquiry.email,
      subject: 'お問い合わせ通知'
    )
  end
end
