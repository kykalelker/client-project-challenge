class SessionsController < ApplicationController
  def new
  end

  def create
    if authenticate
      redirect_to current_user
    else
      render 'new'
    end
  end

  def destroy
    # session.delete(:user_id)
    # render 'new'
    log_out
    redirect_to root_path
  end

end
