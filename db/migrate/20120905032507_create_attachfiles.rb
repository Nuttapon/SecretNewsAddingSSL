class CreateAttachfiles < ActiveRecord::Migration
  def change
    create_table :attachfiles do |t|
      t.references :news

      t.timestamps
    end
    add_index :attachfiles, :news_id
  end
end
