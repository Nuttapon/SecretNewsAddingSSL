class Attachfile < ActiveRecord::Base

  belongs_to :news
  attr_accessible :news_id,:file

  has_attached_file :file, :styles => { :feed => "70x50" ,:small => "150x150>" },
                  :url  => "/assets/attachfiles/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/attachfiles/:id/:style/:basename.:extension"

  #validates_attachment_presence :file
  validates_attachment_size :file, :less_than => 5.megabytes
  # validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

end
