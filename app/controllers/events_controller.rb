class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to event_path(@event.id)
    else
      render :edit
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.admin = current_user

    if @event.save 
      redirect_to event_path(@event.id)
    else
      render :new
    end
  end

  def destroy
    @event = Event.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :start_date, :duration, :description, :price, :location)
  end

end
