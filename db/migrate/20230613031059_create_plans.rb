class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.integer :amount, null: false
      t.string :title, null: false
      t.text :descriptions
      t.string :time, null: false
      t.string :address, null: false
      t.string :vehicles
      t.text :activities
      t.text :notes
      t.integer :plan_audience, default: 0, null: false

      t.timestamps null: false
    end
  end
end
