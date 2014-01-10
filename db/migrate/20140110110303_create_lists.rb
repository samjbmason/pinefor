class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.date :due_date
      t.string :url

      t.timestamps
    end
  end
end
