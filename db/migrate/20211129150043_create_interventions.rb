class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.bigint :author
      t.bigint :customer_id
      t.bigint :building_id
      t.bigint :battery_id
      t.bigint :column_id, null: true
      t.bigint :elevator_id, null: true
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
