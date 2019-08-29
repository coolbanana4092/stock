class FindsController < ApplicationController
  before_action :require_user_logged_in, only: [:index]

  def index
    if params[:created_at]
      @events = Event.all.order(created_at: :desc).page(params[:page]).per(10).judge_created_at(params[:created_at])
    else
      @events = Event.all.order(created_at: :desc).page(params[:page]).per(10)
    end

    @latitude = params[:latitude]
    @longitude = params[:longitude]
  end
end
