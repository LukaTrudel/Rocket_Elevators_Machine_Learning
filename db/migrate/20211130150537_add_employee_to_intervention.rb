class AddEmployeeToIntervention < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :interventions, :employees, column: :employee_id, primary_key: "id"
  end
end
