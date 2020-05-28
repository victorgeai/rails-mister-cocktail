# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

puts "Destroy ingredients"
Ingredient.destroy_all if Rails.env.development?

puts "Destroy Cocktails"
Cocktail.destroy_all if Rails.env.development?

Ingredient.create(name: "lemon")
Ingredient.create(name: "ice")
Ingredient.create(name: "mint leaves")
Ingredient.create(name: "Tabasco")
Ingredient.create(name: "Gin")
Ingredient.create(name: "Bourbon")
Ingredient.create(name: "Calva")
Ingredient.create(name: "Benedictine")
Ingredient.create(name: "Bourbon")


Cocktail.create(name: "Daiqiri")
Cocktail.create(name: "Bloody Mary")
Cocktail.create(name: "Margarita")
