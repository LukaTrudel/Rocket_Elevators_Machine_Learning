class AddBatteryToIntervention < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :interventions, :batteries, column: :battery_id, primary_key: "id"
  end
end
