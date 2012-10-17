class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :email

      t.timestamps
    end
    User.create!(:fullname => "Admin",:password => "mefuwfhfu", :password_confirmation => "mefuwfhfu" ,:email => "admin@gmail.com", :admin => true)
  end
end
