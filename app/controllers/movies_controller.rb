class MoviesController < ApplicationController
	include MoviesHelper

	def index
		@movies = Movie.all
		@moviesRecent = Movie.recent
		@recentMoviesCommented = recentMoviesCommented
	end

	def show
		@movie = Movie.find(params[:id])
	end

  def search
    if params[:query] == ""
      redirect_to root_path
    else
      @q = "%#{params[:query]}%"
      @movies = Movie.where("lower(title) LIKE ?", @q.downcase)
      render "search"
    end
  end
end
