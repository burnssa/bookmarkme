class WelcomeController < ApplicationController
	def index
		@all_topics = Topic.order(created_at: :desc)
	end
end