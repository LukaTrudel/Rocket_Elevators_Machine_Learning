class ChangeColumnNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :interventions, :author, false 
    change_column_null :interventions, :customer_id, false 
    change_column_null :interventions, :building_id, false 
    change_column_null :interventions, :battery_id, false 
  end
end
