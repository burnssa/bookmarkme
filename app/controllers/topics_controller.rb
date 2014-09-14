class TopicsController < ApplicationController
respond_to :html, :json

  def index
    @topics = current_user.topics
		@bookmarks = current_user.bookmarks.paginate(page: params[:page], per_page: 4)
    
    @bookmarks.each do |bookmark|
      @thumbnail_url = bookmark.thumbnail_url
    end
  end

  def update
    topic = Topic.find(params[:id])
    topic.update_attributes(topic_params)
    respond_with topic
  end

  def show
  	topic = Topic.find(params[:id])
  	@bookmarks = topic.bookmarks
  end

  def topic_params
    params.require(:topic).permit(:title)
  end

end
