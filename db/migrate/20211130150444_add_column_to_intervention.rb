class AddColumnToIntervention < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :interventions, :columns, column: :column_id, primary_key: "id"
  end
end
