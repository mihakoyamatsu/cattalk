class RenamePostImageColumnToPostImages < ActiveRecord::Migration[5.2]
  def change
  	rename_column :post_images, :post_image, :post_image_id
  end
end
