class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @topics = Topic.all
    @user = User.friendly.find(params[:id])
    @user_bookmarks = Bookmark.where(user: @user)
    @liked_bookmarks = Bookmark.where(id: Like.where(user: @user).pluck(:bookmark_id))
  end
end
