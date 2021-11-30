class AddElevatorToIntervention < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :interventions, :elevators, column: :elevator_id, primary_key: "id"
  end
end
