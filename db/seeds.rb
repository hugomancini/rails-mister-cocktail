# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'
require 'faker'

Ingredient.destroy_all
Cocktail.destroy_all
Dose.destroy_all

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

cucktails_serial = open(url).read
ingredients = JSON.parse(cucktails_serial)

ingredients["drinks"].each do |drink|
  Ingredient.create!(name: drink["strIngredient1"])
end

50.times do
  cocktail = Cocktail.new(name: Faker::Name.name)
  ingredient = Ingredient.all.sample
  ingredient2 = Ingredient.all.sample
  ingredient3 = Ingredient.all.sample
  dose = Dose.new(description: rand(1..9), cocktail: cocktail, ingredient: ingredient)
  dose2 = Dose.new(description: rand(1..9), cocktail: cocktail, ingredient: ingredient2)
  dose3 = Dose.new(description: rand(1..9), cocktail: cocktail, ingredient: ingredient3)
  dose.save!
  dose2.save!
  dose3.save!
  cocktail.save!
end
