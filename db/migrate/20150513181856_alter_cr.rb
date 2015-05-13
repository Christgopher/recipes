class AlterCr < ActiveRecord::Migration
  def change
        drop_table(:catagories_recipes)
        drop_table(:ingredients_recipes)
  end
end
