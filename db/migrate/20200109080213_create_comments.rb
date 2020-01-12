class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.integer :user_id
      t.string :comment
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
