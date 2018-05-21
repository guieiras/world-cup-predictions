class AddIndexToLeagueOnUuid < ActiveRecord::Migration[5.2]
  def change
    add_index :leagues, :uuid, unique: true
  end
end
