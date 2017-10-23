class LikesController < ApplicationController
  before_action :authenticate_user!

  def index
    @likes = Like.all
  end

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    authorize like

    if like.save
      flash[:notice] = "You have successfully liked this bookmark."
      redirect_to request.referrer
    else
      flash[:alert] = "Something went wrong, your bookmark like failed. Please try again."
      redirect_to request.referrer
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = Like.where(bookmark_id: (params[:bookmark_id]), user_id: current_user.id).first

    authorize like

    if like.destroy
      flash[:notice] = "You have successfully unliked this bookmark."
      redirect_to request.referrer
    else
      flash[:alert] = "Something went wrong, your bookmark unlike failed. Please try again."
      redirect_to request.referrer
    end
  end
end
