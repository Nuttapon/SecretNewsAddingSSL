include ActionView::Helpers::NumberHelper
class Hotnews < ActiveRecord::Base
  
  IP = "http://192.168.1.29"
  belongs_to :user
  acts_as_commentable
  has_many :attachfile_hotnews, :dependent => :destroy
  attr_accessible :title,:user_id,:attachfile_hotnews_attributes

  accepts_nested_attributes_for :attachfile_hotnews, :reject_if => proc { |attributes| attributes['file_hotnews'].blank? }, :allow_destroy => true

  #validates :title, presence: true
  #validates :title ,length: { minimum: 6 }

  def comment
    comments.map(&:comment)
  end

  def file_image
   attachfile_hotnews.collect { |f|
      if (f.file_hotnews_content_type.split("/").first == "image" )
        Hash["link" => IP+ f.file_hotnews.url, "name" => f.file_hotnews_file_name, "size" => number_to_human_size(f.file_hotnews_file_size), "type" => f.file_hotnews_content_type]
      else
        nil
      end
    }.compact
  end

  def file_pdf
   attachfile_hotnews.collect { |f|
      if (f.file_hotnews_content_type.split("/").last == "pdf" )
        Hash["link" => IP+ f.file_hotnews.url, "name" => f.file_hotnews_file_name, "size" => number_to_human_size(f.file_hotnews_file_size), "type" => f.file_hotnews_content_type]
      else
        nil
      end
    }.compact
  end


  def file_video
   attachfile_hotnews.collect { |f|
      if (f.file_hotnews_content_type.split("/").first == "video" )
        Hash["link" => IP+ f.file_hotnews.url, "name" => f.file_hotnews_file_name, "size" => number_to_human_size(f.file_hotnews_file_size), "type" => f.file_hotnews_content_type]
      else
        nil
      end
    }.compact
  end

  def file_thumbnail
    attachfile_hotnews.collect { |f| if (f.file_hotnews_content_type.split("/").first == "image" )
          IP + f.file_hotnews.url(:small)
        else  
          "No Image"
        end

    }.first
  end

  def datetime
    created_at.strftime("%H:%M:%S %d/%m/%Y") 
  end

  def created_by
    user.fullname
  end



end
