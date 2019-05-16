class EventsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  include SessionsHelper

  def index
    @all_events = Event.all.order(created_at: :desc).page(params[:page]).per(10).search(params[:search])
    @current_user_events = current_user.events.order(created_at: :desc).page(params[:page]).per(10).search(params[:search])
    @favorite_events = current_user.favorite_events.order(created_at: :desc).page(params[:page]).per(10).search(params[:search])
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      flash[:success] = "イベントを投稿しました"
      redirect_to events_url
    else
      flash[:negative] = "イベントの投稿に失敗しました"
      flash[:error_count] = @event.errors.count
      flash[:error_content] = @event.errors.full_messages
      redirect_to new_event_url
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      flash[:success] = "イベントを更新しました"
      redirect_to events_url
    else
      flash[:negative] = "イベントの更新に失敗しました"
      flash[:error_count] = @event.errors.count
      flash[:error_content] = @event.errors.full_messages
      redirect_to edit_event_url
    end
  end

  def destroy
    @event.destroy
    flash[:success] = "イベントを削除しました"
    redirect_to events_url
  end

  private

    def event_params
      params.require(:event).permit(:name, :genre, :organizer, :place, :ticket_name, :price,
                                    :starting_year, :starting_month, :starting_day, :starting_hour,
                                    :starting_minute, :ending_year, :ending_month, :ending_day,
                                    :ending_hour, :ending_minute, :content, :cautionary_note, :picture)
    end

    def correct_user
      @event = current_user.events.find_by(id: params[:id])

      unless @event
        redirect_to root_url
      end
    end
end
