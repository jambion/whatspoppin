class Movie < ActiveRecord::Base
  has_many :reviews
  validates :id, presence: true
  validates :title, presence: true
end
