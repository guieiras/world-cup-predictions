class CreateLeagueInvites < ActiveRecord::Migration[5.2]
  def change
    remove_column :league_participations, :invite, :string
    remove_column :league_participations, :active, :boolean

    create_table :league_invites do |t|
      t.string :email
      t.string :uuid
      t.boolean :answered

      t.timestamps
    end
    add_belongs_to :league_invites, :inviter, foreign_key: { to_table: :users }
    add_belongs_to :league_invites, :league, foreign_key: true
    add_index :league_invites, :email
  end
end
