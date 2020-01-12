class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
