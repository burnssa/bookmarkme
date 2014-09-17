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

    current_user = User.find_by_email(sender)
    puts "#{sender}"
    puts "#{current_user}"

    extracted_links = URI.extract(params['stripped-text'])
    bookmarks = extracted_links.collect { |b| Bookmark.new(url: b, user_id: current_user.id) }

    topic_hashtags = params[:subject].split(' ')
    new_topic_titles = []
    new_topic_titles.each {|topic| topic_descriptions << topic.sub(/#/, '')}

    bookmarks.map.each_with_index do |b, t|
      if current_topic_titles.include?(topic_descriptions[t])
        b.topic = topic_descriptions[t]
      else
        bookmark.topic = Topic.new(description: topic_description[t])
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