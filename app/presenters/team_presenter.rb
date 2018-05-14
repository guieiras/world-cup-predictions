class TeamPresenter < SimpleDelegator
  attr_reader :team

  def initialize(team)
    @team = team || NullTeam.new
    __setobj__(@team)
  end

  def name
    I18n.t(fifa_code, scope: 'teams')
  end
end
