class ChangeDataConditionBloodTypeToCats < ActiveRecord::Migration[5.2]
  def change
  	change_column :cats, :condition_blood_type, :string
  end
end
