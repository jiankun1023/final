User.delete_all
Hero.delete_all
Affiliations.delete_all
Movie.delete_all
Attention.delete_all

hero_info  = JSON.parse(open('db/hero.json').read)
movie_info = JSON.parse(open('db/movie.json').read)
affiliations_info = JSON.parse(open('db/affiliations.json').read)

hero_info.each do |hero_data|
    hero = Hero.new
    hero.name = hero_data['name']
    hero.realname = hero_data['realname']
    hero.photo_url = hero_data['photo_url']
    hero.height = hero_data['height']
    hero.weight = hero_data['weight']
    hero.powers = hero_data['powers']
    hero.abilities = hero_data['abilities']
    hero.save
end

movie_info.each do |movie_data|
    movie = Movie.new
    movie.title = movie_data['title']
    movie.image_url = movie_data['image_url']
    puts "movie.title"
end

affiliations_info.each do |affiliations_data|
    affiliations = Affiliations.new
    affiliations.tag = affiliations_data['tag']
    puts "affiliations.tag"
end


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
