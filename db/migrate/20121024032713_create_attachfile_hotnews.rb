class CreateAttachfileHotnews < ActiveRecord::Migration
  def change
    create_table :attachfile_hotnews do |t|
      t.references :hotnews

      t.timestamps
    end
    add_index :attachfile_hotnews, :hotnews_id
  end
end
