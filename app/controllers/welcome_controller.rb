class WelcomeController < ApplicationController
	def index
		#FIXME set up system for ranking top topics
		@topics = Topic.all
  end
end
