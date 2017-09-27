if Rails.env.development?
  address = 'localhost'
  port = '1025'
elsif Rails.env.production?
  address = 'smtp.sendgrid.net'
  port = '2525'
end

if Rails.env.development? || Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address:        address,
    port:           port,
    authentication: :plain,
    user_name:      ENV['SENDGRID_USERNAME'],
    password:       ENV['SENDGRID_PASSWORD'],
    domain:         'heroku.com',
    enable_starttls_auto: true
  }
end
