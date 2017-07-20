module FavoritesHelper
  def already_favorited?(user, movie)
    user ? user.favorites.pluck(:movie_id).include?(movie.id) : false
  end
end
