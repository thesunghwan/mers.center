class CreatePiles < ActiveRecord::Migration
  def change
    create_table :piles do |t|
      t.string :title
      t.string :original_link
      t.string :description
      t.datetime :posted_date
      t.string :author
      t.string :publisher

      t.timestamps null: false
    end
  end
end
