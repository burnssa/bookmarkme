class BookmarksController < ApplicationController
  def index
    @topics = Topic.paginate(page: params[:page], per_page: 10)
  end
end
