class AddRatingToUserInterests < ActiveRecord::Migration
  def change
    add_column :user_interests, :rating, :integer
  end
end
