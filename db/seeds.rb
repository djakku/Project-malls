more_movies= [
  {:title => 'Walmart', :rating => 'Good', :release_date => '25-Nov-1992'}
]

more_movies.each do |movie|
  Movie.create!(movie)
end
