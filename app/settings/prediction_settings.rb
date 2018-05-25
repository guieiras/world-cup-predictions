class PredictionSettings
  def self.open_time
    Setting['predictions.hours_before_game_to_open'].to_i.hours
  end

  def self.close_time
    Setting['predictions.hours_before_game_to_close'].to_i.hours
  end
end
