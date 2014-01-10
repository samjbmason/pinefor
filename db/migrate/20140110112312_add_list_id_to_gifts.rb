class AddListIdToGifts < ActiveRecord::Migration
  def change
    add_column :gifts, :list_id, :integer
  end
end
