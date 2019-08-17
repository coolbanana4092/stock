class User < ApplicationRecord
  attr_accessor :remember_token, :reset_token
  validates :name,  presence: true,
                    length: { maximum: 50 }
  validates :email, presence: true,
                    length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  before_save { self.email.downcase! }
  has_secure_password

  has_many :events, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :fav_events, through: :favorites, source: :event

  def like(event)
    favorites.find_or_create_by(event_id: event.id)
  end

  def unlike(event)
    favorite = favorites.find_by(event_id: event.id)
    favorite.destroy if favorite
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end


  # 永続的セッションの導入
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end


  # パスワードの再設定
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end
end
