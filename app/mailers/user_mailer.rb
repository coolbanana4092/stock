class UserMailer < ApplicationMailer
  def password_reset(user)
    @user = user

    mail(
      from:    'from@example.com',
      to:       user.email,
      subject: 'Password reset'
    )
  end
end
