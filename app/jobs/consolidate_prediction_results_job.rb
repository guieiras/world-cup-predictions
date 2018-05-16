class ConsolidatePredictionResultsJob < ApplicationJob
  queue_as :default

  def perform(match_id)
    match = Match.find(match_id)

    Predictions::ScoreConsolidator.new(match).consolidate
  end
end
