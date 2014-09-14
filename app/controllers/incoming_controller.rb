class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_filter :verify_authenticity_token, only: [:create]

  def create
    # Take a look at these in your server logs
    # to get a sense of what you're dealing with.
    puts "INCOMING PARAMS HERE: #{params}"

    # find the user by the sender 

    sender = params['sender']

    current_user = User.find_by_email(sender)

    bookmark = Bookmark.new(url: params['stripped-text'])

    bookmark.user = current_user

    topic_names = params[:subject].split(' ')
    topic_descriptions = []
    topic_names.each {|topic| topic_descriptions << topic.sub(/#/, '')}

    
    bookmark.save


    # topic_descriptions.each do |t|
    #   if current_user.topics.find { |topic| topic[:description] == t} == true
    #     bookmark.topic = t
    #   else
    #     bookmark.topic = Topic.new(description: t)
    #   end     
    # end

    # def mailin():  
    #     # see if the message is spam:
    #     is_spam = request.form['X-Mailgun-SFlag'] == 'Yes'

    #     # access some of the email parsed values:
    #     request.form['From']
    #     request.form['To']
    #     request.form['subject']

    #     # stripped text does not include the original (quoted) message, only what
    #     # a user has typed:
    #     text = request.form['stripped-text']
    #     request.form['stripped-signature']

    #     puts "#{text}"
    #     return "Ok"

    #     bookmark.save
    #     puts "#{bookmark.description}"
    # end

    # You put the message-splitting and business
    # magic here. 

    # Assuming all went well. 
    head 200
  end
end