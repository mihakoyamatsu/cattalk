class CreateReminders < ActiveRecord::Migration[5.2]
  def change
    create_table :reminders do |t|
      t.datetime :date
      t.text :note
      t.integer :user_id

      t.timestamps
    end
  end
end
