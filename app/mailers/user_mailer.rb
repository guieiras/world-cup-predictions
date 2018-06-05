class UserMailer < ApplicationMailer
  def welcome
    @user = params[:user]
    mail(to: @user.email, subject: I18n.t('user_mailer.welcome.subject'))
  end
end
