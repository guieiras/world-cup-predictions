namespace :setup do
  desc "Setup FIFA World Cup 2018 informations"
  task :world_cup_2018 => :environment do
    seed = YAML.load_file(Rails.root.join('lib/seed/world_cup_2018.yml'))
    ActiveRecord::Base.transaction do
      cached_stadiums = {}
      cached_teams = {}
      cached_matchdays = {}

      # Creating Stadiums
      seed["stadiums"].each do |stadium|
        cached_stadiums[stadium["id"]] =
          Stadium.create(
            name: stadium["name"],
            city: stadium["city"],
            latitude: stadium["lat"],
            longitude: stadium["lng"]
          )
      end

      # Creating Teams
      seed["teams"].each do |team|
        cached_teams[team["id"]] =
          Team.create(
            name: team["name"],
            fifa_code: team["fifaCode"],
            flag_url: team["flag"]
          )
      end

      # Creating Matchdays
      (1..7).each do |code|
        cached_matchdays[code] = Matchday.create(code: code)
      end

      # Creating Matches
      seed["groups"].each do |group_name, group|
        group["matches"].each do |match|
          Match.create(
            code: match["id"],
            home_team: cached_teams[match["home_team"]],
            away_team: cached_teams[match["away_team"]],
            matchday: cached_matchdays[match["matchday"]],
            stadium: cached_stadiums[match["stadium"]],
            datetime: match["date"],
            stage: "group_#{group_name}")
        end
      end

      seed["knockout"].each do |stage, group|
        group["matches"].each do |match|
          Match.create(
            code: match["id"],
            matchday: cached_matchdays[match["matchday"]],
            stadium: cached_stadiums[match["stadium"]],
            datetime: match["date"],
            stage: stage)
        end
      end
    end
  end
end
