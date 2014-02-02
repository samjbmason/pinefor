class CreateMetrics < ActiveRecord::Migration
  def change
    create_table :metrics do |t|
      t.integer :value
      t.string :type

      t.timestamps
    end
  end
end
