class CreateInternationals < ActiveRecord::Migration
  def change
    create_table :internationals do |t|
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
