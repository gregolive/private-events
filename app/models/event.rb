class Event < ApplicationRecord
  has_many :signups, foreign_key: :attended_event_id
  has_many :attendees, through: :signups, source: :event_attendee
  belongs_to :host, class_name: 'User'
end
