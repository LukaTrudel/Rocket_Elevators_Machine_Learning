class AddBuildingToIntervention < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :interventions, :buildings, column: :building_id, primary_key: "id"
  end
end
