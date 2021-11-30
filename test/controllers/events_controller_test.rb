require "test_helper"

class EventsControllerTest < ActionDispatch::IntegrationTest
  def index
    @events = Event.all
    @event = Event.new
  end
end
