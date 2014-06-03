class CreateCorridors < ActiveRecord::Migration
  def change
    create_table :corridors do |t|
      t.integer :number
      t.boolean :active

      t.timestamps
    end
    add_index :corridors, :number
  end
end
