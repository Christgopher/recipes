require('spec_helper')

describe(Recipe) do
  it("validates the presence of characters in the recipes form") do
    recipe = Recipe.new({:name => ""})
    expect(recipe.save()).to(eq(false))
  end
end
