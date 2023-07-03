class ChangeDateFormatInUserTable < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :date_of_birth, 'timestamp USING CAST(date_of_birth AS timestamp)'
  end
end
