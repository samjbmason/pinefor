class AddGiftsCountToLists < ActiveRecord::Migration
  def change
    add_column :lists, :gifts_count, :integer
  end
end
