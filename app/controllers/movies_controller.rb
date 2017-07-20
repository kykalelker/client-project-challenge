class MoviesController < ApplicationController

def index
	@movies = Movie.all
end

end

#add activity feed to the homepage view