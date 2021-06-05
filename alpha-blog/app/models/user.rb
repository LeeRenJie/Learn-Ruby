class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :articles, dependent: :destroy
  validates :username, presence: true, uniqueness: { case_sensitve: false }, length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[a-z0-9\+\-_\.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitve: false }, length: { maximum: 105 }, format: { with: VALID_EMAIL_REGEX }
  has_secure_password
end

