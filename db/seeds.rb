require 'json'
response = HTTParty.get('https://tmdb.lewagon.com/movie/top_rated')
data = JSON.parse(response.body)
movies = data['results'].take(20)

puts 'Cleaning db...'
# Movie.destroy_all
# List.destroy_all
# Bookmark.destroy_all
puts 'Done cleaning!'

puts 'Seeding...'

movies.each do |movie|
  poster_url = 'https://image.tmdb.org/t/p/w500' + movie['poster_path']
  params = {
    title: movie['title'],
    overview: movie['overview'],
    rating: movie['vote_average'],
    poster_url:
  }
  Movie.create(params)
end

puts 'Done'
