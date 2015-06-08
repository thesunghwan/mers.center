class AddFewMoreColumnToPile < ActiveRecord::Migration
  def change
    add_column :piles, :pile_type, :string
    add_column :piles, :curation, :boolean

    add_index :piles, :pile_type
    add_index :piles, :curation
  end
end
