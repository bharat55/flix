class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :fans, through: :favorites, source: :user
  has_many :characterizations, dependent: :destroy
  has_many :genres, through: :characterizations
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

  scope :released_movies, ->{where("released_on < ?",Time.now).order(released_on: :desc)}
  scope :hits, -> {where("rating > ?",5).released_movies}
  scope :flops, -> {where("total_gross < ?",3000000)}

  scope :rated,->(rating){where("rating = ?",rating).released_movies}





  def flop?
    total_gross <50000000
  end





end

