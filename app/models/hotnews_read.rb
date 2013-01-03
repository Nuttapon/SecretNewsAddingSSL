class HotnewsRead < ActiveRecord::Base
  belongs_to :hotnews
  belongs_to :user
  # attr_accessible :title, :body
end
