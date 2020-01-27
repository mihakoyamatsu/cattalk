class ChangeDataAgeToCats < ActiveRecord::Migration[5.2]
  def change
  	change_column :cats, :age, :string
  end
end
