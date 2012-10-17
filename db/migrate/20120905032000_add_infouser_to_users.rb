class AddInfouserToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string
    add_column :users, :remember_token, :string
    add_column :users, :admin, :boolean, :default => false
    add_column :users, :password_reset_token, :string
    add_column :users, :password_rest_sent_at, :datetime
    add_column :users, :last_login, :datetime
    add_column :users, :last_logout, :datetime
  end
end
