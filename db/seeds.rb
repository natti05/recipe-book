require 'open-uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Deleting all recipes"
  Recipe.destroy_all
  User.destroy_all
puts "Everything was destroyed succesfully"

puts "creating recipes and user"

recipe_name = ['recipe title1', 'recipe title2', 'recipe title3']
description_recipe = ['facil e delicioso', 'em um dia quente', 'tradicional']
ingredient_name = ['ovo', 'arroz', 'alho']
preparation_steps = ['cozinhe', 'lave', 'coloque ao forno']

user = User.new(
  email: 'natalia@gmail.com',
  password: '123123'
)
user.save!

  rand(1..10).times do |index|
  recipe_difficulty = Recipe::DIFFICULTIES.sample
    recipe = Recipe.new(
      title:recipe_name.sample,
      description:description_recipe.sample,
      servers: rand(1..5),
      difficulty: recipe_difficulty,
      time: rand(20..160),
      ingredients_attributes: [
        {
          name: ingredient_name.sample ,
          measure: rand(20..160)
        }],
      preparations_attributes: [
        {
        step: preparation_steps.sample
        }],
        user: user
    )

    recipe.save!
  end

puts "Created new recipes and user"
