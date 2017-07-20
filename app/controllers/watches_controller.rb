class WatchesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @movies = Watch.watch_movies(params[:user_id])
  end

  def create
    @movie = Movie.find(params[:movie_id])
    if logged_in?
      @movie.watches.find_or_create_by(user: current_user)
      flash[:notice] = ["Added to watchlist!"]
      redirect_to @movie
    else
      flash[:notice] = ["Please log in to add a movie to your watchlist."]
      redirect_to @movie
    end
  end
end
