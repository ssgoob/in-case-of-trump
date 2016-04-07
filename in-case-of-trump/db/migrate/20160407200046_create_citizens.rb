class CreateCitizens < ActiveRecord::Migration
  def change
    create_table :citizens do |t|

      t.timestamps null: false
    end
  end
end
