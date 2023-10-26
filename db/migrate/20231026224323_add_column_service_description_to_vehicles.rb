class AddColumnServiceDescriptionToVehicles < ActiveRecord::Migration[7.1]
  def change
    add_column :vehicles, :service_description, :text
  end
end
