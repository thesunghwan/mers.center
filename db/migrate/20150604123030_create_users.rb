class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid
      t.string :nickname

      t.timestamps null: false
    end
  end
end
