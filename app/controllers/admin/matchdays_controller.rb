class Admin::MatchdaysController < AdminController
  def index
    @matchdays = Matchday.all
  end
end
