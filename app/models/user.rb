class User < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                                    uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 5 }

  has_secure_password

  before_create do
    self.remember_token = Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64)
  end
end
