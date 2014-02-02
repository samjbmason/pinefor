class CreateMetrics < ActiveRecord::Migration
  def change
    create_table :metrics do |t|
      t.integer :value
      t.string :name

      t.timestamps
    end
  end
end
