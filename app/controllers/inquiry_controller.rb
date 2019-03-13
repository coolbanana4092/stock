class InquiryController < ApplicationController
  def input
    @inquiry = Inquiry.new

    render 'input'
  end

  def thanks
    @inquiry = Inquiry.new(inquiry_params)
    @inquiry.save

    InquiryMailer.send_email(@inquiry).deliver
    redirect_to root_url
  end

  private

    def inquiry_params
      params.require(:inquiry).permit(:name, :email, :message)
    end
end
