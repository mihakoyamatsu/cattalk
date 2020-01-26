class AddDateToCats < ActiveRecord::Migration[5.2]
  def change
    add_column :cats, :date, :string
  end
end
