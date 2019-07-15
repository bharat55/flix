class ChangeRatingToBeIntegerInMovies < ActiveRecord::Migration[5.2]
  def change
    change_column :movies, :rating, :integer
  end
end
