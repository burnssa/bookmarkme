class TopicsController < ApplicationController
respond_to :html, :json

  def index
    @user_topic_ids = current_user.bookmarks.collect { |b| b[:topic_id] }.to_a
    @own_topics = Topic.where(id: @user_topic_ids)
		
    @all_topics = Topic.all.paginate(page: params[:page], per_page: 10)
  end

  def update
    topic = Topic.find(params[:id])
    topic.update_attributes(topic_params)
    respond_with topic
  end

  def show
  	@topic = Topic.find(params[:id])
    @own_bookmark_ids = current_user.bookmarks.collect { |b| b[:id] }.to_a
    
    if current_user
      @own_bookmarks = @topic.bookmarks.where(id: @own_bookmark_ids).paginate(page: params[:page], per_page: 10)
    end
    @others_bookmarks = @topic.bookmarks.where.not(id: @own_bookmark_ids).paginate(page: params[:page], per_page: 10)
  end

  def topic_params
    params.require(:topic).permit(:title)
  end

end
