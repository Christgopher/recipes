class CreateCrIr < ActiveRecord::Migration
  def change
    create_table(:catagories_recipes, id: false) do |t|
      t.belongs_to :catagory, index: true
      t.belongs_to :recipe, index: true
    end
    create_table(:ingredients_recipes, id: false) do |t|
      t.belongs_to :ingredient, index: true
      t.belongs_to :recipe, index: true
    end
  end
end
