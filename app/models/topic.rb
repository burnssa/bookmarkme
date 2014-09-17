class Topic < ActiveRecord::Base
  has_many :bookmarks
  belongs_to :user

	def self.get_current_topic_titles
		current_topics = Topic.all.collect { |t| t.title }
		current_topics
	end
end
