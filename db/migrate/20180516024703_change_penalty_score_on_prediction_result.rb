class ChangePenaltyScoreOnPredictionResult < ActiveRecord::Migration[5.2]
  def change
    remove_column :prediction_results, :home_penalty, :boolean
    remove_column :prediction_results, :away_penalty, :boolean
    add_column :prediction_results, :penalty_result, :boolean
  end
end
