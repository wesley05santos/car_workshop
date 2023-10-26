class CreateVehicles < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicles do |t|
      t.string :model
      t.string :plate
      t.string :brand
      t.datetime :entry_date
      t.datetime :exit_date

      t.timestamps
    end
  end
end
