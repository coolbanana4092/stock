class InquiriesController < ApplicationController
  def input
    @inquiry = Inquiry.new

    render 'input'
  end

  def thanks
    @inquiry = Inquiry.new(inquiry_params)
    
    if @inquiry.save
      InquiryMailer.send_email(@inquiry).deliver
      redirect_to root_url
    else
      redirect_to inquiry_input_url
    end
  end

  private

    def inquiry_params
      params.require(:inquiry).permit(:name, :email, :message)
    end
end
