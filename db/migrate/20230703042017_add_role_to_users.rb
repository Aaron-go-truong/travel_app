class AddRoleToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :role, :integer, default: 0, null: false
    remove_column :users, :avatar
  end
end
