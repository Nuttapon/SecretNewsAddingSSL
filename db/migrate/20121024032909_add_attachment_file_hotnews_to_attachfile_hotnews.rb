class AddAttachmentFileHotnewsToAttachfileHotnews < ActiveRecord::Migration
  def self.up
    add_column :attachfile_hotnews, :file_hotnews_file_name, :string
    add_column :attachfile_hotnews, :file_hotnews_content_type, :string
    add_column :attachfile_hotnews, :file_hotnews_file_size, :integer
    add_column :attachfile_hotnews, :file_hotnews_updated_at, :datetime
  end

  def self.down
    remove_column :attachfile_hotnews, :file_hotnews_file_name
    remove_column :attachfile_hotnews, :file_hotnews_content_type
    remove_column :attachfile_hotnews, :file_hotnews_file_size
    remove_column :attachfile_hotnews, :file_hotnews_updated_at
  end
end
