class CalendarsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:edit, :update] 

  def index
    @events = Event.all 
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_parameter)
    if @event.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def edit
    unless @event.user_id == current_user.id
      redirect_to root_path
    end
  end

  def update
    @event.update(event_parameter)
    if @event.save
      redirect_to action: :index
    else
      render :edit
    end
  end

  def destroy
    event = Event.find(params[:id])
    if current_user.id == event.user_id
      event.destroy
      redirect_to action: :index
    else
      redirect_to root_path
    end
  end

  private

  def event_parameter
    params.require(:event).permit(:title, :content, :start_time).merge(user_id: current_user.id)
  end

  def set_event
    @event = Event.find(params[:id])
  end

end
