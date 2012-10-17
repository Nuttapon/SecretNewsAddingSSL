class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.text :detail
      t.references :user
      t.references :province

      t.timestamps
    end
    add_index :news, :user_id
    add_index :news, :province_id
  end
end
