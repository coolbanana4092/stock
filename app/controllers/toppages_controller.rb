class ToppagesController < ApplicationController
  def index
    if logged_in?
      redirect_to events_url
    else
      @events = Event.all
    end
  end
end
