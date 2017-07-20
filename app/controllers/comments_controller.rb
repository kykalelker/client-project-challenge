class CommentsController < ApplicationController
  def create
    @movie = Movie.find(comment_params[:movie_id])
    if logged_in?
      comment = Comment.new(user: current_user,
                            body: comment_params[:body],
                            commentable_id: comment_params[:commentable_id],
                            commentable_type: comment_params[:commentable_type]
                            )
      if comment.save
        redirect_to @movie
      else
        flash[:notice] = comment.errors.full_messages
        redirect_to @movie
      end
    else
      flash[:notice] = ['Please log in to add a comment.']
      redirect_to @movie
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type, :movie_id)
  end
end
