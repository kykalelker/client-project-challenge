module WatchesHelper
  def already_on_watchlist?(user, movie)
    user ? user.watches.pluck(:movie_id).include?(movie.id) : false
  end
end
