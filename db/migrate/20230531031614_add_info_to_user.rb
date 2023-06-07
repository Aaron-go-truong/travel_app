class AddInfoToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :full_name, :string
    add_column :users, :gender, :string
    add_column :users, :date_of_birth, :string
    add_column :users, :address, :string
    add_column :users, :avt, :string
  end
end
