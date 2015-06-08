class CreateOauths < ActiveRecord::Migration
  def change
    create_table :oauths do |t|
      t.string :user_id
      t.string :uid
      t.string :email

      t.timestamps null: false
    end
  end
end
