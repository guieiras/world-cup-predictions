class CreateStadia < ActiveRecord::Migration[5.2]
  def change
    create_table :stadiums do |t|
      t.string :name
      t.string :city
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
