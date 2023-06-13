class CreatePlanDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :plan_details do |t|
      t.integer :plan_id
      t.integer :plan_detail_id
      t.text :notes

      t.timestamps null: false
    end
    add_index :plan_details, :plan_id
    add_index :plan_details, :plan_detail_id
  end
end
