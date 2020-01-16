class RenamePostImageIdColumnToPostImages < ActiveRecord::Migration[5.2]
  def change
  	rename_column :post_images, :post_image_id, :image_id
  end
end
