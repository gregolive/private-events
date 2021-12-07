class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @events = Event.all
  end

  def show
    @signup = Signup.new
  end

  def new
    @event = current_user.hosted_events.build
  end

  def edit
  end

  def create
    @event = current_user.hosted_events.build(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to root_path, notice: "Your event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: "Event was updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: "Your event was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :location, :description)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
