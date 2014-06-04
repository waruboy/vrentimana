class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.string :text
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
