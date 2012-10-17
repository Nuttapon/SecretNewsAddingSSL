class News < ActiveRecord::Base

  belongs_to :user
  belongs_to :province
  has_many :taggings
  has_many :tags, through: :taggings

  has_many :attachfiles, :dependent => :destroy
  has_many :reads, :dependent => :destroy
  attr_accessible :user_id,:detail, :title,:province_id ,:attachfiles_attributes, :tag_tokens
  attr_reader :tag_tokens
  accepts_nested_attributes_for :attachfiles, :reject_if => proc { |attributes| attributes['file'].blank? }, :allow_destroy => true

  validates :title, presence: true, length: { maximum: 50 }
  validates :detail, presence: true
  validates :province_id, presence: true

  def image
    attachfiles.collect { |f| if (f.file_content_type.split("/").first == "image" )
        "http://192.168.5.106:3000" + f.file.url(:feed)
      else
        "No image"
      end
    }.first
  end

  def tag_tokens=(tokens)
    self.tag_ids = Tag.ids_from_tokens(tokens)
  end

  def tag_list
    tags.map(&:name).join(",")
  end

end
