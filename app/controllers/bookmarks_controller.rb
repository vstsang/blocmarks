class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @topic = Topic.friendly.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def create
    @topic = Topic.friendly.find(params[:topic_id])
    @bookmark = @topic.bookmarks.new
    @bookmark.url = params[:bookmark][:url]
    @bookmark.user = current_user

    if @bookmark.save
      flash[:notice] = "Bookmark was saved."
      redirect_to [@topic]
    else
      flash.now[:alert] = "There was an error saving the bookmark. Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    session[:return_to] ||= request.referer
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    @bookmark.url = params[:bookmark][:url]
    @bookmark.user = current_user

    authorize @bookmark

    if @bookmark.save
      flash[:notice] = "Bookmark was updated."
      redirect_to session.delete(:return_to)
    else
      flash.now[:alert] = "There was an error saving the bookmark. Please try again."
      render :edit
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])

    authorize @bookmark

    if @bookmark.destroy
      flash[:notice] = "\"#{@bookmark.url}\" was deleted successfully."
      redirect_to :back
    else
      flash.now[:alert] = "There was an error deleting the bookmark."
      render :show
    end
  end
end
