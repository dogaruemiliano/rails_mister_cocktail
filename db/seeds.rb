# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

puts "Seed started"

Ingredient.destroy_all
Cocktail.destroy_all

puts "All previous models destroyed"

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

raw_data = open(url).read
ingredients = JSON.parse(raw_data)['drinks']

puts "Done parsing data from the server"

ingredients.each do |ingredient_hash|
  ingredient = ingredient_hash['strIngredient1']
  Ingredient.create!(name: ingredient)
end

puts "Done seeding the ingredients"
puts "Start seeding cocktails"

Cocktail.create(name: "Mojito")

puts "Done seeding cocktails"
puts "Seed ended"
