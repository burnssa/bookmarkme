class Topic < ActiveRecord::Base
  has_many :bookmarks
  belongs_to :user

def current_topic_titles
	
end


end
