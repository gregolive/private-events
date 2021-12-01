class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = current_user.hosted_events.build
  end

  def create
    @event = current_user.hosted_events.build(events_params)

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

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: "Your event was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private

  def events_params
    params.require(:event).permit(:name, :date, :location, :description)
  end
end
