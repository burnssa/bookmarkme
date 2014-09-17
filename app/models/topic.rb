class Topic < ActiveRecord::Base
  has_many :bookmarks
  belongs_to :user

	def self.get_current_topic_titles
		current_topic_titles = Topic.all.collect { |t| t.title }
	end
end
