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
end
