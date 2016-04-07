class CreateInternationals < ActiveRecord::Migration
  def change
    create_table :internationals do |t|

      t.timestamps null: false
    end
  end
end
