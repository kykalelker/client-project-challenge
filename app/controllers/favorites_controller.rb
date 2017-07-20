class FavoritesController < ApplicationController
  def show
  end

  def create
    @movie = Movie.find(params[:movie_id])
    if logged_in?
      @movie.favorites.find_or_create_by(user: current_user)
      flash[:notice] = ["Added to favorites!"]
      redirect_to @movie
    else
      flash[:notice] = ["Please log in to add a movie to your favorites list."]
      redirect_to @movie
    end
  end
end
