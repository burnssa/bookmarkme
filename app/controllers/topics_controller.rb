class TopicsController < ApplicationController

  def index
    @topics = current_user.topics
		@bookmarks = current_user.bookmarks
  end

  def show
  	@topic = Topic.friendly.find(params[:id])
  end
end
