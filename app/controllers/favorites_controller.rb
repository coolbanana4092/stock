class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    @event = Event.find(params[:event_id])
    current_user.like(@event)
    like = current_user.fav_events.build(id: params[:event_id])
    like.save
  end

  def destroy
    @event = Event.find(params[:event_id])
    current_user.unlike(@event)
  end
end
