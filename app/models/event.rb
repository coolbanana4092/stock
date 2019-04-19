class Event < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :genre, presence: true, length: { maximum: 50 }
  validates :organizer, presence: true, length: { maximum: 50 }
  validates :place, presence: true, length: { maximum: 50 }
  validates :ticket_name, presence: true, length: { maximum: 50 }
  validates :price, presence: true, length: { maximum: 50 }
  validates :starting_year, presence: true, length: { maximum: 4 }
  validates :starting_month, presence: true, length: { maximum: 2 }
  validates :starting_day, presence: true, length: { maximum: 2 }
  validates :starting_hour, presence: true, length: { maximum: 2 }
  validates :starting_minute, presence: true, length: { maximum: 2 }
  validates :ending_year, presence: true, length: { maximum: 4 }
  validates :ending_month, presence: true, length: { maximum: 2 }
  validates :ending_day, presence: true, length: { maximum: 2 }
  validates :ending_hour, presence: true, length: { maximum: 2 }
  validates :ending_minute, presence: true, length: { maximum: 2 }
  validates :content, presence: true, length: { maximum: 50 }

  belongs_to :user, optional: true

  def self.search(search)
    if search
      where(['name LIKE ?', "%#{search}%"])
    else
      all
    end
  end
end
