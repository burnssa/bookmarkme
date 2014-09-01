class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:email])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.user_id
  		redirect_to bookmarks_path, 
  	else

  	end
  end
end
