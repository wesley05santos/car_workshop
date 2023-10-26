class ChangeColumnProblemDescriptionFromVehicle < ActiveRecord::Migration[7.1]
  def change
    change_column :vehicles, :problem_description, :text
  end
end
