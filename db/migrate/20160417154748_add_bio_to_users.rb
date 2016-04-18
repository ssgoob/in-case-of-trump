class AddBioToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fear, :string
    add_column :users, :movie, :string
    add_column :users, :book, :string
    add_column :users, :bio, :string
  end
end
