# Override your default settings for the Production environment here.
# 
# Example:
#   configatron.file.storage = :s3

RAILS_ROOT,APN::App::RAILS_ENV = Rails.env

  configatron.apn.passphrase  = '1150'
  configatron.apn.port  = 2195
  configatron.apn.host  = 'gateway.sandbox.push.apple.com'
  configatron.apn.cert = File.join(RAILS_ROOT, 'config', 'apple_push_notification_production.pem')

  configatron.apn.feedback.passphrase  = '1150'
  configatron.apn.feedback.port  = 2196
  configatron.apn.feedback.host  = 'feedback.sandbox.push.apple.com'
  configatron.apn.feedback.cert = File.join(RAILS_ROOT, 'config', 'apple_push_notification_production.pem')