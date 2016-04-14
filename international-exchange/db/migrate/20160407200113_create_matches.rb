class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :status
      t.integer :citizen_id
      t.integer :international_id
      t.timestamps null: false
    end
  end
end
