class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true,
                   uniqueness: { case_sensitive: false},
                   length: { minimum: 5, maximum: 50 }
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { minimum: 5, maximum: 500 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true,
                       length: { minimum: 6 }

  attr_accessor :remember_token

  has_secure_password

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  # Returns the hash digest of the given string.
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Password.create(string, cost: cost)
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
end
