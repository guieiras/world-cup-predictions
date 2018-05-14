class ConsolidatePredictionResultsJob < ApplicationJob
  queue_as :default

  def perform(match_id)
    match = Match.find(match_id)

    ScoreConsolidator.new(match).consolidate
  end
end
