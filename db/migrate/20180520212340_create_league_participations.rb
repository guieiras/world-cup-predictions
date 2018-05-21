class CreateLeagueParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :league_participations do |t|
      t.string :invite
      t.boolean :active

      t.timestamps
    end
    add_belongs_to :league_participations, :user, foreign_key: true
    add_belongs_to :league_participations, :league, foreign_key: true
    add_index :league_participations, [:user_id, :league_id], unique: true
  end
end
