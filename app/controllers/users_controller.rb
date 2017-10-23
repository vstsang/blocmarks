class UsersController < ApplicationController
  def show
    @topics = Topic.all
    @user_bookmarks = Bookmark.where(user: params[:id])
    @liked_bookmarks = Bookmark.where(id: Like.where(user: params[:id]).pluck(:bookmark_id))
  end
end
