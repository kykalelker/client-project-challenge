# Seed users
content_for_users = [
  { :username => "tim",
    :email => "tim@test.com",
    :password => "1234" },
  { :username => "pat",
    :email => "pat@test.com",
    :password => "1234" },
  { :username => "sam",
    :email => "sam@test.com",
    :password => "1234" }
]

User.create!(content_for_users)
# Seed more faker users
12.times do
  User.create(
  username: Faker::Name.unique.first_name,
  email: Faker::Internet.email,
  password: "1234"
  )
end

# Seed movies
movies = Movie.create([{title: "Jaws", year: 1995, lead_actor: "Shark", boxart_url: "https://vignette3.wikia.nocookie.net/jaws/images/d/da/Jaws-movie-poster.jpg/revision/latest?cb=20131015071208", creator_id: 1}, {title: "Castaway", year: 2000, lead_actor: "Wilson", boxart_url: "https://fontmeme.com/images/Cast-Away-Poster.jpg", creator_id: 2}])

# Seed more fake movies
50.times do
  Movie.create(
  title: Faker::Book.title,
  year: Faker::Date.between(80.years.ago, Date.today).year,
  lead_actor: Faker::Name.name,
  boxart_url: "https://s-media-cache-ak0.pinimg.com/236x/b7/13/2b/b7132b0b47d4cac8b157fc209576146c--pam-grier-alternative-movie-posters.jpg",
  creator_id: rand(1..15))
end


# Seed comments
comments = Comment.create([{user_id: 1, body: Faker::Lorem.paragraph(2), commentable_id: 1, commentable_type: "Movie"}, {user_id: 2, body: Faker::Lorem.paragraph(2), commentable_id: 1, commentable_type: "Comment"}, {user_id: 1, body: Faker::Lorem.paragraph(2), commentable_id: 2, commentable_type: "Comment"}, {user_id: 2, body: Faker::Lorem.paragraph(2), commentable_id: 2, commentable_type: "Comment"}])

# Seed comments on movies
(1..52).each do |i|
  user_set = (4..15).to_a
  3.times do
    user = user_set.sample
    Comment.create(
    user_id: user,
    commentable_type: "Movie",
    commentable_id: i,
    body: Faker::Lorem.paragraph(3)
    )
    user_set.delete(user)
  end
end

# Seed comments on comments
comment_list = (1..156).to_a

target_comments = comment_list.select {|x| x % 5 == 0 }
target_comments.each do |i|
  Comment.create(
  user_id: 1,
  commentable_type: "Comment",
  commentable_id: i,
  body: Faker::Lorem.paragraph(2)
  )
end

target_comments = comment_list.select {|x| x % 13 == 0 }
target_comments.each do |i|
  Comment.create(
  user_id: 2,
  commentable_type: "Comment",
  commentable_id: i,
  body: Faker::Lorem.paragraph(2)
  )
end

target_nested_comments = (157..199).to_a
target_nested_comments.each do |i|
  Comment.create(
  user_id: 3,
  commentable_type: "Comment",
  commentable_id: i,
  body: Faker::Lorem.paragraph(2)
  )
end

# Seed favorites
(1..15).each do |i|
  movie_set = (1..52).to_a
  5.times do
    movie = movie_set.sample
    Favorite.create(
    user_id: i,
    movie_id: rand(1..52)
    )
    movie_set.delete(movie)
  end
end

# Seed watches
(1..15).each do |i|
  movie_set = (1..52).to_a
  5.times do
    movie = movie_set.sample
    Watch.create(
    user_id: i,
    movie_id: rand(1..52)
    )
    movie_set.delete(movie)
  end
end
