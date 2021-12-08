class SignupsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  
  def create
    @signup = Signup.new
    @signup.event_attendee_id = params[:signup][:event_attendee_id]
    @signup.attended_event_id = params[:signup][:attended_event_id]

    respond_to do |format|
      if @signup.save
        format.html { redirect_to @signup.attended_event, notice: "You have joined the event." }
        format.json { render :show, status: :created, location: @signup.attended_event }
      else
        format.html { redirect_to @signup.attended_event, status: :unprocessable_entity }
        format.json { render json: @signup.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @signup = Signup.find(params[:id])
    @event = @signup.attended_event
    @signup.destroy

    redirect_to @event
  end
end
