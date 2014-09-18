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

    current_user = User.find_by_email(sender) || User.create!(email: params['sender'], password: 'Asdf1234', password_confirmation: 'Asdf1234')
    puts "#{sender}"
    puts "#{current_user.name}"
    puts "#{params['stripped-text']}"

    email_subject_string = params['stripped-text'].to_s

    extracted_links = URI.extract(email_subject_string, ['ftp','http','https','ftp','mailto','www'])
    bookmarks = extracted_links.collect { |b| Bookmark.new(url: b, user_id: current_user.id) }

    topic_hashtags = params[:subject].split(' ')
    new_topic_titles = []
    topic_hashtags.each {|topic| new_topic_titles << topic.sub(/#/, '')}

    current_topic_titles = Topic.get_current_topic_titles

    bookmarks.each_with_index do |b, t|
      title_index = new_topic_titles[t] || new_topic_titles[-1]
      b.topic = Topic.new(title: title_index)
      topic = b.topic
      topic.save
      bookmark = b 
      bookmark.save   
    end
    # You put the message-splitting and business
    # magic here. 

    # Assuming all went well. 
    head 200
  end
end