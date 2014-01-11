class RemoveBeenBoughtFromGifts < ActiveRecord::Migration
  def change
    remove_column :gifts, :been_bought, :boolean
  end
end
