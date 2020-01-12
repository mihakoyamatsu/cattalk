class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :room_id
      t.integer :chat_user_id
      t.string :body
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
