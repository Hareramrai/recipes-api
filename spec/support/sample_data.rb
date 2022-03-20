# frozen_string_literal: true

RSpec.shared_context "sample recipes" do
  let!(:recipe_one) do
    recipe = build(:recipe, title: "recipe_one", category: "bread")
    recipe.ingredients << build(:ingredient, title: "ingredient_one")
    recipe.save!
    recipe
  end

  let!(:recipe_two) do
    recipe = build(:recipe, title: "recipe_two", category: "pasta")
    recipe.ingredients << build(:ingredient, title: "ingredient_two")
    recipe.save!
    recipe
  end
end

RSpec.shared_context "json sample recipes" do
  let(:json_recipes) do
    [
      { title: "Golden Sweet Cornbread", cook_time: 25, prep_time: 10, ingredients: ["1 cup all-purpose flour", "1 cup yellow cornmeal", "⅔ cup white sugar", "1 teaspoon salt", "3 ½ teaspoons baking powder", "1 egg", "1 cup milk", "⅓ cup vegetable oil"], ratings: 4.74, cuisine: "", category: "Cornbread", author: "bluegirl", image: "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F43%2F2021%2F10%2F26%2Fcornbread-1.jpg" },
      { title: "Monkey Bread I", cook_time: 35, prep_time: 15, ingredients: ["3 (12 ounce) packages refrigerated biscuit dough", "1 cup white sugar", "2 teaspoons ground cinnamon", "½ cup margarine", "1 cup packed brown sugar", "½ cup chopped walnuts", "½ cup raisins"], ratings: 4.74, cuisine: "", category: "Monkey Bread", author: "deleteduser", image: "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F43%2F2018%2F11%2F546316.jpg" },
    ]
  end
end
