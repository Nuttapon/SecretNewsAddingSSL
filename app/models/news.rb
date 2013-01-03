include ActionView::Helpers::NumberHelper
class News < ActiveRecord::Base

  IP = "http://192.168.1.29"
  acts_as_commentable
  belongs_to :user

  has_many :taggings
  has_many :tags, through: :taggings

  has_many :attachfiles, :dependent => :destroy
  has_many :reads, :dependent => :destroy
  attr_accessible :user_id,:detail, :title ,:attachfiles_attributes, :tag_tokens,:province

  attr_reader :tag_tokens
  accepts_nested_attributes_for :attachfiles, :reject_if => proc { |attributes| attributes['file'].blank? }, :allow_destroy => true

  validates :title, presence: true, length: { maximum: 255 }
  validates :detail, presence: true

  def comment
    comments.map(&:comment)
  end

  def file_image
    attachfiles.collect { |f|
      if (f.file_content_type.split("/").first == "image")
        Hash["link" => IP+ f.file.url, "name" => f.file_file_name, "size" => number_to_human_size(f.file_file_size), "type" => f.file_content_type]
      else
        nil
      end
    }.compact
  end

  def file_pdf
    attachfiles.collect { |f|
      if (f.file_content_type.split("/").last == "pdf")
        Hash["link" => IP+ f.file.url, "name" => f.file_file_name, "size" => number_to_human_size(f.file_file_size), "type" => f.file_content_type]
      else
        nil
      end
    }.compact
  end

    def file_video
    attachfiles.collect { |f|
      if (f.file_content_type.split("/").first == "video")
        Hash["link" => IP+ f.file.url, "name" => f.file_file_name, "size" => number_to_human_size(f.file_file_size), "type" => f.file_content_type]
      else
        nil
      end
    }.compact
  end

    def file_thumbnail
    attachfiles.collect { |f| if (f.file_content_type.split("/").first == "image" )
          IP + f.file.url(:small)
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

  def tag_tokens=(tokens)
    self.tag_ids = Tag.ids_from_tokens(tokens)
  end

  def tag_list
    tags.map(&:name).join(",")
  end

end
