class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @movies = @user.movies
    @favorites = @user.favorites
    @comments = @user.comments
    @com_movies = @user.commented_movies
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
