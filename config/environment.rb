# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

if ENV['MAILTRAP_HOST'].present?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    :user_name => ENV['MAILTRAP_USER_NAME'],
    :password => ENV['MAILTRAP_PASSWORD'],
    :address => ENV['MAILTRAP_HOST'],
    :port => ENV['MAILTRAP_PORT'],
    :authentication => :plain
  }
end