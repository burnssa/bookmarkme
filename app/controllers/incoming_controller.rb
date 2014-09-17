class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_filter :verify_authenticity_token, only: [:create]
  require 'uri'

  def create
    # Take a look at these in your server logs
    # to get a sense of what you're dealing with.
    puts "INCOMING PARAMS HERE: #{params}"

    # find the user by the sender 

    sender = params['sender']

    current_user = User.find_by_email(sender) ||= User.new(email: sender)
    puts "#{sender}"
    puts "#{current_user}"

    extracted_links = URI.extract(params['stripped-text'])
    bookmarks = extracted_links.collect { |b| Bookmark.new(url: b, user_id: current_user.id) }

    topic_names = params[:subject].split(' ')
    topic_descriptions = []
    topic_names.each do {|topic| topic_descriptions << topic.sub(/#/, '')}

    bookmarks.map.each_with_index do |b, t|
      if current_user.topic_descriptions.find { |topic| topic[:description] == t} == true
        b.topic = t
      else
        bookmark.topic = Topic.new(description: t)
        bookmark.save
        
        topic = bookmark.topic
        topic.save
      end     
    end

    



    # You put the message-splitting and business
    # magic here. 

    # Assuming all went well. 
    head 200
  end
end