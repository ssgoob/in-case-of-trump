class AddMaxAgeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :maxage, :integer
  end
end
