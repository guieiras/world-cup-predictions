class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :fifa_code
      t.string :flag_url

      t.timestamps
    end
  end
end
