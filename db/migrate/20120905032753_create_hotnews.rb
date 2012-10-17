class CreateHotnews < ActiveRecord::Migration
  def change
    create_table :hotnews do |t|
      t.string :title
      t.references :user

      t.timestamps
    end
    add_index :hotnews, :user_id
  end
end
