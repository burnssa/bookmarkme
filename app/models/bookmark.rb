class Bookmark < ActiveRecord::Base
	belongs_to: user, through: topic
end
