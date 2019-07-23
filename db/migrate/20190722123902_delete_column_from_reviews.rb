class DeleteColumnFromReviews < ActiveRecord::Migration[5.2]
  def up
    Review.destroy_all
    remove_column :reviews, :name
    add_column :reviews, :user_id, :integer
  end

  def down
    add_column :reviews, :name, :string
    remove_column :reviews, :user_id
  end
end
