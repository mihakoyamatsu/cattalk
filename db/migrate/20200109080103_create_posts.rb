class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :body
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
