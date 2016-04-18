class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :gender
      t.datetime :dob
      t.string :location
      t.string :preference
      t.string :interests
      t.string :photos
      t.timestamps null: false
    end
  end
end
