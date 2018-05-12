class CreatePredictions < ActiveRecord::Migration[5.2]
  def change
    create_table :predictions do |t|
      t.integer :home_score
      t.integer :away_score
      t.integer :home_penalty
      t.integer :away_penalty

      t.timestamps
    end
    add_belongs_to :predictions, :user, foreign_key: true
    add_belongs_to :predictions, :match, foreign_key: true
  end
end
