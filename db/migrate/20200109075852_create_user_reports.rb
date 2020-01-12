class CreateUserReports < ActiveRecord::Migration[5.2]
  def change
    create_table :user_reports do |t|
      t.integer :report_user_id
      t.integer :reported_user_id
      t.string :report_message
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
