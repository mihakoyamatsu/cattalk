class CreatePostReports < ActiveRecord::Migration[5.2]
  def change
    create_table :post_reports do |t|
      t.integer :post_id
      t.integer :user_id
      t.string :report_message
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
