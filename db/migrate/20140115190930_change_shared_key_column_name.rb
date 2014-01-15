class ChangeSharedKeyColumnName < ActiveRecord::Migration
  def change
    rename_column :lists, :shared_key, :public_hash
  end
end
