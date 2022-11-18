class BookmarksController < ApplicationController

  def show
    @list = List.find(params[:id])
    @list.bookmarks = @bookmarks
  end

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @movie = Movie.find(params[:bookmark][:movie_id])
    @comment = params[:bookmark][:comment]
    @bookmark = Bookmark.new(comment: @comment, movie: @movie, list: @list)
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

end
