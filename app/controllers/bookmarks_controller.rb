class BookmarksController < ApplicationController
  def new
    @movies = Movie.all
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    # bookmark = bookmark_params
    # bookmark['movie'] = Movie.find(bookmark['movie'])
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy; end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie)
  end
end
