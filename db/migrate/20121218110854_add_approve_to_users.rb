class AddApproveToUsers < ActiveRecord::Migration
  def change
    add_column :users, :approve, :boolean, :default => false
    User.create!(:fullname => "Admin",:password => "mefuwfhfu", :password_confirmation => "mefuwfhfu" ,:email => "admin@hotmail.com", :admin => true, :approve => true)
  end
end
