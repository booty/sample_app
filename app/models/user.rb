class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true,
                   uniqueness: { case_sensitive: false},
                   length: {minimum: 5, maximum: 50 }
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: {minimum: 5, maximum: 500 },
                    format: {with: VALID_EMAIL_REGEX}
end