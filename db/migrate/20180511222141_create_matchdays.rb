class CreateMatchdays < ActiveRecord::Migration[5.2]
  def change
    create_table :matchdays do |t|
      t.integer :code
      t.string :name
      t.boolean :finished

      t.timestamps
    end
  end
end
