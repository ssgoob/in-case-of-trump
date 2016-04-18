class ChangeAgeToDob < ActiveRecord::Migration
  def change
    rename_column :users, :age, :dob
  end
end
