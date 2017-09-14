class Review < ActiveRecord::Base
  belongs_to :movie
  before_save { self.user_email = user_email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates(:user_email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX })
  validates :rating, presence: true
end