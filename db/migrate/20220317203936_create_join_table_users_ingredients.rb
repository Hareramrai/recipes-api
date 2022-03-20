class CreateJoinTableUsersIngredients < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :ingredients do |t|
      t.index [:user_id, :ingredient_id], unique: true
    end
  end
end
