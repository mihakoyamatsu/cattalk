class AddAreaToCats < ActiveRecord::Migration[5.2]
  def change
    add_column :cats, :area, :string
  end
end
