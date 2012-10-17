class Hotnews < ActiveRecord::Base
  belongs_to :user
  attr_accessible :title,:file,:user_id

  validates :title, presence: true
  validates :title ,length: { minimum: 6 }
  has_attached_file :file, #:styles => { :small => "150x50>" },  #:feed => "70x50" ,
                  :url  => "/assets/attachfiles/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/attachfiles/:id/:style/:basename.:extension"

  validates_attachment_presence :file
  #validates_attachment_size :file, :less_than => 5.megabyte
  validates_attachment_content_type :file, :content_type => 'application/pdf'


  def filepdf
  	"http://192.168.5.106:3000/" + file.url
  end

end
