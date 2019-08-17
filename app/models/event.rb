class Event < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :genre, presence: true, length: { maximum: 50 }
  validates :organizer, presence: true, length: { maximum: 100 }
  validates :place, presence: true, length: { maximum: 100 }
  validates :ticket_name, presence: true, length: { maximum: 50 }
  validates :price, presence: true, length: { maximum: 10 }
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
  validates :content, presence: true, length: { maximum: 2000 }
  validates :cautionary_note, length: { maximum: 2000 }

  belongs_to :user, optional: true
  has_many :favorites, dependent: :destroy
  has_many :fav_users, through: :favorites

  mount_uploader :picture, PictureUploader

  private

    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "写真の容量は5MB以下にしてください")
      end
    end

    def self.search(search)
      if search
        where(['name LIKE ?', "%#{search}%"])
      else
        all
      end
    end

    # FindsControllerと同様に、いろいろな方法を試したが、
    # 以下の6つの似た様な関数を適切に簡略化することができなかったため、とりあえずそのまま6つとも記しておく。
    def self.judge_created_at_today
      from  = 1.day.ago.beginning_of_day
      to = Time.zone.now.end_of_day
      where(created_at: from...to)
    end

    def self.judge_created_at_3d
      from  = 3.day.ago.beginning_of_day
      to = Time.zone.now.end_of_day
      where(created_at: from...to)
    end

    def self.judge_created_at_1w
      from  = 1.week.ago.beginning_of_day
      to = Time.zone.now.end_of_day
      where(created_at: from...to)
    end

    def self.judge_created_at_1m
      from  = 1.month.ago.beginning_of_day
      to = Time.zone.now.end_of_day
      where(created_at: from...to)
    end

    def self.judge_created_at_3m
      from  = 3.month.ago.beginning_of_day
      to = Time.zone.now.end_of_day
      where(created_at: from...to)
    end

    def self.judge_created_at_6m
      from  = 6.month.ago.beginning_of_day
      to = Time.zone.now.end_of_day
      where(created_at: from...to)
    end
end
