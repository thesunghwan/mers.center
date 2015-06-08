class AddUidColumn < ActiveRecord::Migration
  def change
    add_column :piles, :uid, :string
    add_index :piles, :uid
    add_index :piles, :posted_date
    add_index :piles, :publisher
  end
end
