class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :fans, through: :favorites, source: :user
  RATINGS=%w( PG PG-13 R NC-17)
  validates :image_file_name, allow_blank: true, format: {
    with: /\w+\.(gif|jpg|png|jpeg)\z/i,
    message: "must reference a GIF, JPG, or PNG image"
  }
   validates :title, presence: true
   validates :description, presence: true
   validates :duration, presence: true
   validates :description, length: {  in: 25..4000 }
   validates :total_gross, numericality: {greater_than_or_equal_to: 0}


  scope :show_hit_movies, -> {where("rating > ?",5)}


  def flop?
    total_gross <50000000
  end





end

