class Read < ActiveRecord::Base
  belongs_to :user
  belongs_to :news
  # attr_accessible :title, :body
end
