require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
require "pry"
get("/") do
  erb(:index)
end

get("/recipes") do
  @recipes = Recipe.all()
  erb(:recipes)
end

post("/recipe") do
  recipe = Recipe.create({name: params.fetch("name"), instructions: params.fetch("instruction")})
  @recipes = Recipe.all()
  erb(:recipes)
end

get("/recipe/:id") do
  recipe_id = params.fetch("id").to_i
  @recipe = Recipe.find(recipe_id)
  @ingredients = Ingredient.all()
  erb(:recipe)
end

patch("/recipe/:id") do
  ingredient_ids = params.fetch("ingredient_ids")
  @recipe = Recipe.find(params.fetch("id").to_i())

  ingredient_ids.each() do |ingredient_id|
    ingredient = Ingredient.find(ingredient_id.to_i())
    @recipe.ingredients.push(ingredient)
  end
  @ingredients = Ingredient.all()
  erb(:recipe)
end

patch("/recipe_rating") do
  @recipe = Recipe.find(params.fetch('recipe_id').to_i)
  @recipe.update({rating: params.fetch('rating').to_i})
  @ingredients = Ingredient.all()
  erb(:recipe)
end

get("/ingredients") do
  @ingredients = Ingredient.all()
  erb(:ingredients)
end

post("/ingredient") do
  recipe = Ingredient.create({name: params.fetch("name")})
  @ingredients = Ingredient.all()
  erb(:ingredients)
end

get("/ingredient/:id") do
  ingredient_id = params.fetch("id").to_i
  @ingredient = Ingredient.find(ingredient_id)
  erb(:ingredient)
end

get("/catagories") do
  @catagories = Catagory.all()
  erb(:catagories)
end

get("/catagory/:id") do
  catagory_id = params.fetch("id").to_i
  @catagory = Catagory.find(catagory_id)
  @recipes = Recipe.all()
  erb(:catagory)
end

post("/catagory") do
  @catagory = Catagory.create({name: params.fetch("name")})
  @catagories = Catagory.all()
  erb(:catagory)
end

patch("/catagory/:id") do
  recipe_ids = params.fetch("recipe_ids")
  @catagory = Catagory.find(params.fetch("id").to_i())
  recipe_ids.each() do |recipe_id|
    recipe = Recipe.find(recipe_id.to_i())
    @catagory.recipes.push(recipe)
  end
  @recipes = Recipe.all()
  erb(:catagory)
end
