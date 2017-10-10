class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    # Find the user by using params[:sender]
    params[:sender]

    # Find the topic by using params[:subject]
    params[:subject]

    # Assign the url to a variable after retreiving it from params["body-plain"]
    params["body-plain"]

    # Check if user is nil, if so, create and save a new user with random password
    if User.where(email: params[:sender]).empty?
      User.create!(
        email: params[:sender],
        password: random_password(8),
        role: 0
      )
    end

    # Reset password after generating new user random password
    email_user_id = User.where(email: params[:sender]).pluck(:id)
    User.find(email_user_id.first).send_reset_password_instructions

    # Check if the topic is nil, if so, create and save a new topic
    if Topic.where(title: params[:subject]).empty?
      Topic.create!(
        title: params[:subject],
        user_id: User.where(email: params[:sender]).pluck(:id)
      )
    else
      @topic = Topic.where(title: params[:subject])
    end

    # Now that you're sure you have a valid user and topic, build and save a new bookmark
    @bookmark = @topic.bookmarks.new
    @bookmark.url = params["body-plain"]

    head 200
  end

  private
  # Generates random password for new user
  def random_password(pass_length)
    o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    rand_pass = (0...pass_length).map { o[rand(o.length)] }.join
  end
end
