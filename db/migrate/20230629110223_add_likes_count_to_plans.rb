class AddLikesCountToPlans < ActiveRecord::Migration[6.1]
  def change
    add_column :plans, :likes_count, :integer, default: 0, null: false
  end
end
