class ToppagesController < ApplicationController
  def index
    @events = Event.all
  end
end
