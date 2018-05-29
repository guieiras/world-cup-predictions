class LeagueInviteMailer < ApplicationMailer
  def welcome
    @invite = params[:invite]
    mail(to: @invite.email, subject: I18n.t('league_invite_mailer.welcome.subject'))
  end
end
