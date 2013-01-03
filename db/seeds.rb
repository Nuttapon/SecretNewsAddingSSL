 app = APN::App.new   
 app.apn_dev_cert = Rails.root.join('config', 'apple_push_notification_development.pem').read
 app.apn_prod_cert = Rails.root.join('config', 'apple_push_notification_production.pem').read
 app.save!


 g = APN::Group.new
 g.name = "NIA"
 g.app_id = 1
 g.save