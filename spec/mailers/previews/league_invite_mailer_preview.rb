class LeagueInviteMailerPreview < ActionMailer::Preview
  def welcome
    LeagueInviteMailer.with(invite: LeagueInvite.first).welcome
  end
end
