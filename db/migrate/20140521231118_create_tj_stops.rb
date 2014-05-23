class CreateTjStops < ActiveRecord::Migration
  def change
    create_table :tj_stops do |t|
      t.string :name
      t.string :google_lookup
      t.float :latitude
      t.float :longitude

      t.index :latitude
      t.index :longitude

      t.timestamps
    end
  end
end
