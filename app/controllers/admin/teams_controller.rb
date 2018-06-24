class Admin::TeamsController < AdminController
  def index
    render json: (Team.all.map do |team|
      { id: team.id, flag_url: team.flag_url, name: I18n.t(team.fifa_code, scope: 'teams') }
    end)
  end
end
