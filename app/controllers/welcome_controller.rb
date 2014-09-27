class WelcomeController < ApplicationController
	def index
		@all_topics = Topic.all
	end
end