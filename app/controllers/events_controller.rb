class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.admin = current_user

    if @event.save
      redirect_to @event
    else
      render new_event_path
    end
  end
end
