class AddMinAgeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :minage, :integer
  end
end
