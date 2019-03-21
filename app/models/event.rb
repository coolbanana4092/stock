class Event < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :genre, presence: true, length: { maximum: 50 }
  validates :organizer, presence: true, length: { maximum: 50 }
  validates :place, presence: true, length: { maximum: 50 }
  validates :ticket_name, presence: true, length: { maximum: 50 }
  # validates :price, presence: true, length: { maximum: 50 }, numericality: { only_integer: true }
  # validates :starting_year, presence: true, length: { maximum: 4 }, numericality: { only_integer: true }
  # validates :starting_month, presence: true, length: { maximum: 2 }, numericality: { only_integer: true }
  # validates :starting_day, presence: true, length: { maximum: 2 }, numericality: { only_integer: true }
  # validates :starting_hour, presence: true, length: { maximum: 2 }, numericality: { only_integer: true }
  # validates :starting_minute, presence: true, length: { maximum: 2 }, numericality: { only_integer: true }
  # validates :ending_year, presence: true, length: { maximum: 4 }, numericality: { only_integer: true }
  # validates :ending_month, presence: true, length: { maximum: 2 }, numericality: { only_integer: true }
  # validates :ending_day, presence: true, length: { maximum: 2 }, numericality: { only_integer: true }
  # validates :ending_hour, presence: true, length: { maximum: 2 }, numericality: { only_integer: true }
  # validates :ending_minute, presence: true, length: { maximum: 2 }, numericality: { only_integer: true }
  validates :content, presence: true, length: { maximum: 50 }

  before_save { self.price.downcase! }
  before_save { self.starting_year.downcase! }
  before_save { self.starting_month.downcase! }
  before_save { self.starting_day.downcase! }
  before_save { self.starting_hour.downcase! }
  before_save { self.starting_minute.downcase! }
  before_save { self.ending_year.downcase! }
  before_save { self.ending_month.downcase! }
  before_save { self.ending_day.downcase! }
  before_save { self.ending_hour.downcase! }
  before_save { self.ending_minute.downcase! }

  belongs_to :user, optional: true
end
