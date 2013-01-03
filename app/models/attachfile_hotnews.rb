class AttachfileHotnews < ActiveRecord::Base
  belongs_to :hotnews

  attr_accessible :hotnews_id ,:file_hotnews
  

  has_attached_file :file_hotnews, :styles => lambda {|a| ["image/jpeg", "image/png","image/gif"].include?(a.content_type) ? {:small => "404x324>"} : {}},
                  :url  => "/assets/hotnews/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/hotnews/:id/:style/:basename.:extension"

  validates_attachment_size :file_hotnews, :less_than => 5.megabyte, :if => lambda { |a| a.file_hotnews_content_type.split("/").first == "image" }


end
