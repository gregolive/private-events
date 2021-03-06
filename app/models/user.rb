class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true, length: { in: 4..14 }
  validates :email, presence: true, uniqueness: true

  has_many :signups, foreign_key: :event_attendee_id
  has_many :attended_events, through: :signups
  has_many :hosted_events, foreign_key: :host_id, class_name: 'Event'
end
