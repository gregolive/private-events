class Event < ApplicationRecord
  has_many :signups, foreign_key: :attended_event_id
  has_many :attendees, through: :signups, source: :event_attendee
  belongs_to :host, class_name: 'User'

  validates :name, presence: true, uniqueness: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 15 }
  validates :location, presence: true
  validates :date, presence: true, future: true

  scope :upcoming, -> { where('date >= ?', DateTime.now).order(:date) }
  scope :past, -> { where('date < ?', DateTime.now).order(:date) }
end
