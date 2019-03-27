class Inquiry < ApplicationRecord
  validates :name, length: { maximum: 50 }
  validates :email, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_save { self.email.downcase! }
  validates :message, presence: true, length: { maximum: 200 }
end
