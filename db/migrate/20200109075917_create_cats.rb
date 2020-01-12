class CreateCats < ActiveRecord::Migration[5.2]
  def change
    create_table :cats do |t|
      t.integer :user_id
      t.string :image_id
      t.string :name
      t.integer :sex
      t.integer :age
      t.integer :breed
      t.string :weight
      t.integer :blood_type
      t.text :story
      t.integer :purpose
      t.integer :condition_sex
      t.integer :condition_breed
      t.integer :condition_age
      t.integer :condition_blood_type
      t.string :condition_weight
      t.string :term
      t.text :note
      t.integer :status

      t.timestamps
    end
  end
end
