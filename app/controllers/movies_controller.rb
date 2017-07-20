class MoviesController < ApplicationController
  def show
    # do error handling for if a movie doesn't exist
    @movie = Movie.find_by(id: params[:id])
    @comments = @movie.comments
    @comment = Comment.new
  end
end
