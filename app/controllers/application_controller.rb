class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	before_filter :show_topics_page

private
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	helper_method :current_user

	def authorize
		redirect_to topics_path, alert: "Not authorized"
	end

  def show_topics_page
    render topics_path if current_user?  # you have to define maintenance?
  end

end
