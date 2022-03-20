# frozen_string_literal: true

require "swagger_helper"

RSpec.describe "Api::V1::Users::RecipeRecommendationsontroller", type: :request, swagger_doc: SWAGGER_V1_DOC do
  include_context "sample recipes"

  let!(:user) { create(:user) }
  let(:user_id) { user.id }
  let(:Authorization) { authenticate_headers(user)["Authorization"] }

  path "/users/{user_id}/recipe_recommendations/" do
    get "List of recommended recipes" do
      tags "User recipe recommendations API"

      consumes MIME_APPLICATION_JSON
      security [jwt: []]
      parameter name: :user_id, in: :path, type: :string

      response "200", "returns matching recipe by user_ingredients" do
        before { user.ingredients = Ingredient.all }

        schema \
          type: :array, items: { "$ref" => "#/components/schemas/recipe" }

        run_test! do
          expect(json_response(response).size).to eq(2)
        end
      end
    end

    get "List of recommended recipes when missing user_ingredients" do
      tags "User recipe recommendations API"

      consumes MIME_APPLICATION_JSON
      security [jwt: []]
      parameter name: :user_id, in: :path, type: :string

      response "200", "returns no record" do
        run_test! do
          expect(json_response(response)).to be_blank
        end
      end
    end
  end
end
