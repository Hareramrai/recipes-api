class CreateJoinTableRecipesIngredient < ActiveRecord::Migration[6.0]
  def change
    create_join_table :recipes, :ingredients do |t|
      t.index [:recipe_id, :ingredient_id], unique: true
    end
  end
end
