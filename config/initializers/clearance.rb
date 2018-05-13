Clearance.configure do |config|
  config.mailer_sender = "reply@example.com"
  config.rotate_csrf_on_sign_in = true
end

Rails.application.config.to_prepare do
  Clearance::PasswordsController.layout "authorization"
  Clearance::SessionsController.layout "authorization"
  Clearance::UsersController.layout "authorization"
end
