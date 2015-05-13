require('spec_helper')

describe(Ingredient) do
  it("validates the presence of characters in the ingredients form") do
    ingredient = Ingredient.new({:name => ""})
    expect(ingredient.save()).to(eq(false))
  end
end
