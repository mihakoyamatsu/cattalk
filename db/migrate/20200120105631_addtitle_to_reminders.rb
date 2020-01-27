class AddtitleToReminders < ActiveRecord::Migration[5.2]
  def change
  	add_column :reminders, :title, :string
  end
end
