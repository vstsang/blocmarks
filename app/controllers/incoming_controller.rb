class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    puts "Here is body-plain: #{params["body-plain"]}"

    # Check if user is nil, if so, create and save a new user with random password
    if User.where(email: params[:sender]).empty?
      User.create!(
        email: params[:sender],
        password: random_password(8),
        role: 0
      )

      # Reset password after generating new user random password
      email_user_id = User.where(email: params[:sender]).pluck(:id).first
      User.find(email_user_id).send_reset_password_instructions
    end

    # Check if the topic is nil, if so, create and save a new topic
    if Topic.where(title: params[:subject]).empty?
      @topic = Topic.create!(
        title: params[:subject],
        user_id: User.where(email: params[:sender]).pluck(:id).first
      )
    else
      @topic = Topic.where(title: params[:subject]).first
    end

    # Now that you're sure you have a valid user and topic, build and save a new bookmark
    @topic.bookmarks.create!(
      url: params["body-plain"].strip
    )

    head 200
  end

  private
  # Generates random password for new user
  def random_password(pass_length)
    o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    rand_pass = (0...pass_length).map { o[rand(o.length)] }.join
  end
end
