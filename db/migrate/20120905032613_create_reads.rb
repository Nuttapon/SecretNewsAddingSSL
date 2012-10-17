class CreateReads < ActiveRecord::Migration
  def change
    create_table :reads do |t|
      t.references :user
      t.references :news

      t.timestamps
    end
    add_index :reads, :user_id
    add_index :reads, :news_id
  end
end
