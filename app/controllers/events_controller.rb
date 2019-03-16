class EventsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  include SessionsHelper

  def index
    @all_events = Event.all.order(created_at: :desc).page(params[:page]).per(10)
    @current_user_events = current_user.events.order(created_at: :desc).page(params[:page]).per(10)
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
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url
  end

  private

    def event_params
      params.require(:event).permit(:name, :genre, :organizer, :place, :ticket_name, :price,
                                    :starting_time, :ending_time, :content, :cautionary_note)
    end

    def correct_user
      @event = current_user.events.find_by(id: params[:id])

      unless @event
        redirect_to root_url
      end
    end
end
