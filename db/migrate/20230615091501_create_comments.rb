class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :content, null:false
      t.references :user, null: false, foreign_key: true
      t.references :plan, null: false, foreign_key: true
      t.references :cmt_parent, foreign_key: { to_table: :comments }
      t.timestamps
    end
  end
end
