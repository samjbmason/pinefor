class AddDetailsToGifts < ActiveRecord::Migration
  def change
    change_column :gifts, :price, :decimal, precision: 10, scale: 2
  end
end
