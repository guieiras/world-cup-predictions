class MatchPresenter < SimpleDelegator
  attr_reader :match

  def self.wrap(matches)
    matches.map { |match| new(match) }
  end

  def initialize(match)
    @match = match
    __setobj__(match)
  end

  def identifier
    I18n.t('match.identifier', code: code)
  end

  def home_team
    @home_team ||= TeamPresenter.new(match.home_team)
  end

  def away_team
    @away_team ||= TeamPresenter.new(match.away_team)
  end

  def home_complete_score
    penalty_score = home_penalty ? "(#{home_penalty})" : ""
    home_score ? home_score.to_s + penalty_score : '-'
  end

  def away_complete_score
    penalty_score = away_penalty ? "(#{away_penalty})" : ""
    away_score ? away_score.to_s + penalty_score : '-'
  end

  def datetime format=:xshort
    I18n.l(match.datetime, format: format)
  end

  def stage
    I18n.t(match.stage, scope: 'match.stage')
  end

  def closed_at
    match.datetime - PredictionSettings.close_time
  end

  def status
    if closed_at < 5.hours.from_now
      "danger"
    elsif closed_at < 1.day.from_now
      "warning"
    else
      "default"
    end
  end
end
