class AddProblemDescriptionToVehicles < ActiveRecord::Migration[7.1]
  def change
    add_column :vehicles, :problem_description, :string
  end
end
