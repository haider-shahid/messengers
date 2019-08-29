class User < ApplicationRecord
  validates :username, presence: true,uniqueness: true,length: {minimum: 3,maximum: 15}
  validates :password_digest, presence: true
  has_secure_password
end
