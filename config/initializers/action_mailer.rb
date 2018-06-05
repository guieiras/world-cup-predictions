unless Rails.env.development? || Rails.env.test?
  ActionMailer::Base.smtp_settings = {
    :user_name => ENV.fetch('SENDGRID_USERNAME'),
    :password => ENV.fetch('SENDGRID_PASSWORD'),
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
  }
end