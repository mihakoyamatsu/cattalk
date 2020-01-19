class CreateDirectMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :direct_messages do |t|
      t.integer :room_id
      t.integer :user_id
      t.string :body
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
