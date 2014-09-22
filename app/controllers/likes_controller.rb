class LikesController < ApplicationController
	def create
		@bookmark = Bookmark.find(params[:bookmark_id])
		like = current_user.likes.build(bookmark: @bookmark)
	
		if like.save
       flash[:notice] = "You liked the bookmark."
       redirect_to(:back)
     else
       flash[:error] = "The bookmark couldn't be liked. Try again."
       redirect_to(:back)
     end
	end

	def destroy
		@bookmark = Bookmark.find(params[:bookmark_id])
		like = current_user.likes.find_by_bookmark_id(@bookmark.id)

		if like.destroy
       flash[:notice] = "You have unliked the bookmark."
       redirect_to(:back)
     else
       flash[:error] = "The bookmark couldn't be unliked. Please try again."
       redirect_to(:back)
     end
	end
end
