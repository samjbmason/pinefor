class UpdateListsGiftCount < ActiveRecord::Migration
  def change
    # Runs through all existing lists and create gift count
    List.find_each do |list|
      List.reset_counters(list.id, :gifts)
    end
  end
end
