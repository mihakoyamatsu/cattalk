class CreatePostImages < ActiveRecord::Migration[5.2]
  def change
    create_table :post_images do |t|
      t.integer :post_id
      t.string :post_image
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
