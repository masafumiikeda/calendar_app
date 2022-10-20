class CalendarsController < ApplicationController
  before_action :authenticate_user!
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
    @event = Event.find(params[:id])
    unless @event.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_parameter)
      redirect_to action: :index
    else
      render :edit
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to action: :index
  end

  private

  def event_parameter
    params.require(:event).permit(:title, :content, :start_time).merge(user_id: current_user.id)
  end
end
