users = User.create([{username: 'tim', email: 'tim@test.com', password: '1234'}, {username: 'pat', email: 'pat@test.com', password: '1234'}])

movies = Movie.create([{title: "Jaws", year: 1995, lead_actor: "Shark", boxart_url: "https://vignette3.wikia.nocookie.net/jaws/images/d/da/Jaws-movie-poster.jpg/revision/latest?cb=20131015071208", creator_id: 1}, {title: "Castaway", year: 2000, lead_actor: "Wilson", boxart_url: "https://fontmeme.com/images/Cast-Away-Poster.jpg", creator_id: 2}])
