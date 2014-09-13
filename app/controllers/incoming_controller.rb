class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_filter :verify_authenticity_token, only: [:create]

  def create
    # Take a look at these in your server logs
    # to get a sense of what you're dealing with.
    puts "INCOMING PARAMS HERE: #{params}"

    # find the user by the sender 
    current_user = User.find_by_email(params[:sender])

    bookmark = Bookmark.new(url: params['stripped-text'])

    bookmark.user = current_user

    topic_names = params[:subject].split(' ')
    topic_descriptions = []
    topic_names.each {|topic| topic_descriptions << topic.sub(/#/, '')}

    topic_descriptions.each do |t|
      if current_user.topics.find { |topic| topic[:description] == t} == true
        bookmark.topic = t
      else
        bookmark.topic = Topic.new(description: t)
      end     
    end

    bookmark.save

    # You put the message-splitting and business
    # magic here. 

    # Assuming all went well. 
    head 200
  end
end