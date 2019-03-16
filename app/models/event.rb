class Event < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :genre, presence: true, length: { maximum: 50 }
  validates :organizer, presence: true, length: { maximum: 50 }
  validates :place, presence: true, length: { maximum: 50 }
  validates :ticket_name, presence: true, length: { maximum: 50 }
  validates :price, presence: true, length: { maximum: 50 }
  validates :starting_time, presence: true, length: { maximum: 50 }
  validates :ending_time, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 50 }
  validates :cautionary_note, presence: true, length: { maximum: 50 }

  belongs_to :user
end
