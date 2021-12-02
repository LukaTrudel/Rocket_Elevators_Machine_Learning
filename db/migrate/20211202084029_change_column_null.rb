class ChangeColumnNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :interventions, :author, :null => false 
    change_column_null :interventions, :customer_id, :null => false 
    change_column_null :interventions, :building_id, :null => false 
  end
end
