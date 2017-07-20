class MoviesController < ApplicationController

	include MoviesHelper

	def index
		@movies = Movie.all
		@moviesRecent = Movie.recent
		@recentMoviesCommented = recentMoviesCommented
	end

	def show
		@movie = Movie.find_by(id: params[:id])
    @comments = @movie.comments
    @comment = Comment.new
	end

  def new
    if !logged_in?
      redirect_to new_login_path
    else
      @movie = Movie.new
    end
  end

  def create
    if !logged_in?
      redirect_to new_login_path
    else
      @movie = Movie.new(movie_params)
      @movie.creator_id = current_user.id

      if @movie.save
        redirect_to @movie
      else
        render "new"
      end
    end
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

  private
  def movie_params
    params.require(:movie).permit(:title, :year, :lead_actor, :boxart_url)
  end
end
