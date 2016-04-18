class ChangeDobToDatetime < ActiveRecord::Migration
  def change
    change_column :users, :dob, "USING dob::datetime without time zone"
  end
end
