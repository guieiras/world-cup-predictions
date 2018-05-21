class CreateLeagues < ActiveRecord::Migration[5.2]
  def change
    create_table :leagues do |t|
      t.string :name
      t.string :description
      t.string :uuid

      t.timestamps
    end
    add_belongs_to :leagues, :creator, foreign_key: { to_table: 'users' }
  end
end
