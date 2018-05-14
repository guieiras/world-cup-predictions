class CreatePredictionResults < ActiveRecord::Migration[5.2]
  def change
    create_table :prediction_results do |t|
      t.boolean :home_score
      t.boolean :away_score
      t.boolean :home_penalty
      t.boolean :away_penalty
      t.boolean :game_winner
      t.boolean :penalty_winner
      t.boolean :match_winner
      t.boolean :score_difference
      t.integer :score

      t.timestamps
    end

    add_belongs_to :prediction_results, :prediction, foreign_key: true, null: false, unique: true
  end
end
