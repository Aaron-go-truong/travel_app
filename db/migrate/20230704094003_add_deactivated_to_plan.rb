class AddDeactivatedToPlan < ActiveRecord::Migration[6.1]
  def change
    add_column :plans, :deactivated, :boolean, default: false, null: false
  end
end
