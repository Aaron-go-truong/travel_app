class RenameFullnameToUsername < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :full_name, :user_name
  end
end
