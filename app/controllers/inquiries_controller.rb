class InquiriesController < ApplicationController
  def input
    @inquiry = Inquiry.new

    render 'input'
  end

  def thanks
    @inquiry = Inquiry.new(inquiry_params)

    if @inquiry.save
      InquiryMailer.send_email(@inquiry).deliver
      flash[:success] = "お問い合わせを送信しました。"
      redirect_to root_url
    else
      flash[:negative] = "お問い合わせの送信に失敗しました。"
      redirect_to inquiry_input_url
    end
  end

  private

    def inquiry_params
      params.require(:inquiry).permit(:name, :email, :message)
    end
end
