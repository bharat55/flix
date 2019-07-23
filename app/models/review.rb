class Review < ApplicationRecord
  STARS = [1,2,3,4,5]
  belongs_to :movie
  belongs_to :user
  validates :stars, presence: true, :inclusion => 1..5
  validates :comment, presence: true


end
