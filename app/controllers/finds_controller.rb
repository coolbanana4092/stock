class FindsController < ApplicationController
  before_action :require_user_logged_in, only: [:index]

  def index
    # いろいろな方法を試したが、以下の上から6つの似た様なインスタンス変数を
    # judge_created_atの様なメソッドに置き換えて、1つのインスタンス変数に適切sにまとめることができなかったので、
    # とりあえずそのまま6つとも記しておく。
    if params[:created_at] == "today"
      @events = Event.all.order(created_at: :desc).page(params[:page]).per(10).judge_created_at_today
    elsif params[:created_at] == "3_days_later"
      @events = Event.all.order(created_at: :desc).page(params[:page]).per(10).judge_created_at_3d
    elsif params[:created_at] == "1_week_later"
      @events = Event.all.order(created_at: :desc).page(params[:page]).per(10).judge_created_at_1w
    elsif params[:created_at] == "1_month_later"
      @events = Event.all.order(created_at: :desc).page(params[:page]).per(10).judge_created_at_1m
    elsif params[:created_at] == "3_months_later"
      @events = Event.all.order(created_at: :desc).page(params[:page]).per(10).judge_created_at_3m
    elsif params[:created_at] == "6_months_later"
      @events = Event.all.order(created_at: :desc).page(params[:page]).per(10).judge_created_at_6m
    else
      @events = Event.all.order(created_at: :desc).page(params[:page]).per(10)
    end
  end
end
