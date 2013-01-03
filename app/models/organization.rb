class Organization < ActiveRecord::Base
  
  attr_accessible :name, :logo
  validates :name, presence: true
  has_attached_file :logo, :styles => { :small => "150x50>" ,:medium => "450x150>" },  #:feed => "70x50" ,
                  :url  => "/assets/attachfiles/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/attachfiles/:id/:style/:basename.:extension"

  validates_attachment_presence :logo
  #validates_attachment_size :logo, :less_than => 5.megabytes
  validates_attachment_content_type :logo, :content_type => ['image/jpg','image/jpeg','image/png']

end
