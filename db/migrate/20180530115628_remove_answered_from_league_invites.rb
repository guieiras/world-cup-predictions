class RemoveAnsweredFromLeagueInvites < ActiveRecord::Migration[5.2]
  def change
    remove_column :league_invites, :answered, :boolean
  end
end
