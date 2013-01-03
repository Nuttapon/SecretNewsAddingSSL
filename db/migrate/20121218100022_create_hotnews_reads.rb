class CreateHotnewsReads < ActiveRecord::Migration
  def change
    create_table :hotnews_reads do |t|
      t.references :hotnews
      t.references :user

      t.timestamps
    end
    add_index :hotnews_reads, :hotnews_id
    add_index :hotnews_reads, :user_id
  end
end
