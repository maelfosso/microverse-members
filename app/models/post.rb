class Post < ApplicationRecord
  belongs_to :user

  validates :story, presence: true, length: { minimum: 10 }
  validates :user, presence: true
end
