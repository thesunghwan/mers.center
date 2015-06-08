class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :case_id
      t.string :gender
      t.integer :age
      t.date :developed
      t.date :diagnosed
      t.string :contracted_place
      t.string :contracted_from
      t.string :relationship
      t.string :relationship_code
      t.date :possible_contracted_date
      t.integer :days_to_show
      t.integer :days_to_be_diagnosed
      t.text :remarks

      t.timestamps null: false
    end
  end
end
