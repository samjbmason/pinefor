class ChangeUrlColumnName < ActiveRecord::Migration
  def change
    rename_column :lists, :url, :shared_key
  end
end
