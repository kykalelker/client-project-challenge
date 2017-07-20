module MoviesHelper

def recentMoviesCommented
	movies = []
	Comment.recent.each do |comment|
  		movies << comment.root_movie
  	end
  	movies.uniq
end

end
