class BookmarksController < ApplicationController
	def destroy
		@bookmark = Bookmark.find(params[:id])
		@topic = @bookmark.topic

		if @bookmark.destroy
    	flash[:notice] = "You have deleted this bookmark."
     	redirect_to @topic
     else
       flash[:error] = "Bookmark couldn't be deleted. Try again."
       redirect_to @topic
     end
   end
end
