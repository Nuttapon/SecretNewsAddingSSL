class Attachfile < ActiveRecord::Base

  belongs_to :news

  attr_accessible :news_id,:file
  

  has_attached_file :file, :styles => lambda {|a| ["image/jpeg", "image/png","image/gif"].include?(a.content_type) ? {:small => "404x324>"} : {}},
                  :url  => "/assets/news/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/news/:id/:style/:basename.:extension"

  #validates_attachment_presence :file
  #validates_attachment_size :file, :less_than => 5.megabytes
  # validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

 

end
