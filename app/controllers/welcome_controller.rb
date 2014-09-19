class WelcomeController < ApplicationController
	def index
		#FIXME set up system for ranking top topics
		@topics = Topics.all
  end
end
