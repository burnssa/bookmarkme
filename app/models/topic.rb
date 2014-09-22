class Topic < ActiveRecord::Base
  has_many :bookmarks

	def self.get_current_topic_titles
		current_topic_titles = Topic.all.collect { |t| t.title }
	end
end
