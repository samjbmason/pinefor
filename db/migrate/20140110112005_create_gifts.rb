class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string :name
      t.decimal :price
      t.string :link
      t.boolean :been_bought

      t.timestamps
    end
  end
end
