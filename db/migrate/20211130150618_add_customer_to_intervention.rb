class AddCustomerToIntervention < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :interventions, :customers, column: :customer_id, primary_key: "id"
  end
end
