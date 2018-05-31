class HomeController < ApplicationController
  def index
    @dashboard = HomeDashboard.new(
      current_user, current_user.predictions.includes(:match, :result))
  end
end
