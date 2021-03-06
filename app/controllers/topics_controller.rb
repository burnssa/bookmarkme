class TopicsController < ApplicationController
respond_to :html, :json

  def index
    @liked_topic_ids = []
    if current_user
      @user_topic_ids = current_user.bookmarks.collect { |b| b[:topic_id] }.to_a 
      
      current_user.bookmarks.each do |b|
        if current_user.liked(b)
          @liked_topic_ids << current_user.liked(b).bookmark.topic_id
        end
        @liked_topic_ids
      end

      @personal_topic_ids = (@user_topic_ids + @liked_topic_ids).uniq
      @own_topics = Topic.where(id: @personal_topic_ids).paginate(page: params[:page], per_page: 4)	
      @others_topics = Topic.where.not(id: @personal_topic_ids).paginate(page: params[:page], per_page: 4)
    else
      @own_topics = []
      @others_topics = Topic.all.paginate(page: params[:page], per_page: 4)  
    end
  end

  def update
    topic = Topic.find(params[:id])
    topic.update_attributes(topic_params)
    respond_with topic
  end

  def show
  	@topic = Topic.find(params[:id])
    if current_user
      @own_bookmark_ids = current_user.bookmarks.collect { |b| b[:id] }.to_a

      @liked_bookmark_ids = []
    
      Bookmark.all.each do |b|
        if current_user.liked(b)
          @liked_bookmark_ids << b.id
        end
        @liked_bookmark_ids
      end
    
      @personal_bookmark_ids = @own_bookmark_ids + @liked_bookmark_ids
      @personal_bookmarks = @topic.bookmarks.where(id: @personal_bookmark_ids).paginate(page: params[:page], per_page: 10)
      @others_bookmarks = @topic.bookmarks.where.not(id: @personal_bookmark_ids).paginate(page: params[:page], per_page: 10)
    else 
      @others_bookmarks = @topic.bookmarks
      @personal_bookmarks = []
    end 
  end

  def topic_params
    params.require(:topic).permit(:title)
  end

end
