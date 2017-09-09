class Movie < ActiveRecord::Base
  has_many :reviews
  validates :id, presence: true, numericality: { only_integer: true }
  validates :title, presence: true
end

