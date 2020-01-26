class ChangeDataBreedToCats < ActiveRecord::Migration[5.2]
  def change
  	change_column :cats, :breed, :string
  end
end
