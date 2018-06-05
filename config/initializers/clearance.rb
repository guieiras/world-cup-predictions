Clearance.configure do |config|
  config.mailer_sender = ENV.fetch('EMAIL_SENDER')
  config.rotate_csrf_on_sign_in = true
  config.sign_in_guards = [EmailConfirmationGuard]
end

Rails.application.config.to_prepare do
  Clearance::PasswordsController.layout "authorization"
  Clearance::SessionsController.layout "authorization"
  Clearance::UsersController.layout "authorization"
end
