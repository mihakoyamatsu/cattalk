class RemovemailAddressFromUsers < ActiveRecord::Migration[5.2]
  def change
  	remove_column :users, :mail_address, :string
  end
end
