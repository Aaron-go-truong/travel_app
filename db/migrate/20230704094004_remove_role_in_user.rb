class RemoveRoleInUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :role
  end
end
