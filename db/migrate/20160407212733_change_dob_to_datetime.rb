class ChangeDobToDatetime < ActiveRecord::Migration
  def change
    change_column :users, :dob, "USING dob::timestamp without time zone"
  end
end
