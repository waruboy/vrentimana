class AddCorridorIdToTjStop < ActiveRecord::Migration
  def change
    add_column :tj_stops, :corridor_id, :integer
    add_index :tj_stops, :corridor_id
  end
end
