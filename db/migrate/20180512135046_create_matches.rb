class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.integer :home_score
      t.integer :away_score
      t.integer :home_penalty
      t.integer :away_penalty
      t.datetime :datetime

      t.timestamps
    end

    add_belongs_to :matches, :home_team, foreign_key: { to_table: 'teams' }
    add_belongs_to :matches, :away_team, foreign_key: { to_table: 'teams' }
    add_belongs_to :matches, :stadium, foreign_key: true
    add_belongs_to :matches, :matchday, foreign_key: true
  end
end
