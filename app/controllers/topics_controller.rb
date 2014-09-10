class TopicsController < ApplicationController

	helper_method :course_user_count


  def index
    @topics = current_user.topics
		@bookmarks = current_user.bookmarks
    
    @bookmarks.each do |bookmark|
      @thumbnail_url = bookmark.thumbnail_url
    end
  end

  def show
  	topic = Topic.find(params[:id])
  	@bookmarks = topic.bookmarks
  end
end
