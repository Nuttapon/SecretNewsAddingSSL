class AddAdminToUser < ActiveRecord::Migration
  def change
  	User.create!(:fullname => "Admin",:password => "mefuwfhfu", :password_confirmation => "mefuwfhfu" ,:email => "admin@hotmail.com", :admin => true)
  end
end
