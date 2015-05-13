class TablesAdded < ActiveRecord::Migration
  def change
    create_table(:recipes) do |t|
      t.column(:name, :string)
      t.column(:instructions, :string)
      t.column(:rating, :integer)
    end

    create_table(:catagories) do |t|
      t.column(:name, :string)
    end

    create_table(:catagories_recipes) do |t|
      t.column(:recipe_id, :int)
      t.column(:catagory_id, :int)
    end

    create_table(:ingredients) do |t|
      t.column(:name, :string)
    end

    create_table(:ingredients_recipes) do |t|
      t.column(:recipe_id, :int)
      t.column(:ingredient_id, :int)
    end
  end
end
