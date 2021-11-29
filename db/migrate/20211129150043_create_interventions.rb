class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.integer :author
      t.integer :customer_id
      t.integer :building_id
      t.integer :battery_id, null: true
      t.integer :column_id, null: true
      t.integer :elevator_id, null: true
      t.integer :employee_id, null: true
      t.datetime :start_of_intervention, null: true
      t.datetime :end_of_intervention, null: true
      t.string :result, default: "Incomplete"
      t.string :report
      t.string :status, default: "Pending"

      t.timestamps
    end
  end
end
