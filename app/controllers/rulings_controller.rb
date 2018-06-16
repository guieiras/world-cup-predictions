class RulingsController < ApplicationController
  include ActionView::Helpers::DateHelper
  def index
    time = DateTime.current
    @time_to_open = distance_of_time_in_words(time, time + PredictionSettings.open_time)
    @time_to_close = distance_of_time_in_words(time, time + PredictionSettings.close_time)
  end
end