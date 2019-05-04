class Inquiry < ApplicationRecord
  validates :name,  length: { maximum: 50 }
  validates :email, presence: true,
                    length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :message, presence: true, length: { maximum: 200 }
  before_save { self.email.downcase! }
end
