class Admin::LeaderboardController < AdminController
  def index
    @leaders = LeadersQuery.execute
  end
end