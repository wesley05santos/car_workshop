class AddColumToVehicles < ActiveRecord::Migration[7.1]
  def change
    add_column :vehicles, :entry_km, :integer
    add_column :vehicles, :year, :integer
    add_column :vehicles, :exit_km, :integer
  end
end
