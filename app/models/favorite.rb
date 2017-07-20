class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  def self.fav_movies(user_id)
    list = Favorite.where(user_id: user_id)
    list.map do |item|
      item.movie
    end
  end

end
