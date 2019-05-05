class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    event = Event.find(params[:event_id])
    current_user.like(event)
    flash[:success] = 'イベントをお気に入りしました'
    redirect_to events_url
  end

  def destroy
    event = Event.find(params[:event_id])
    current_user.unlike(event)
    flash[:success] = 'イベントのお気に入りを外しました'
    redirect_to events_url
  end
end
