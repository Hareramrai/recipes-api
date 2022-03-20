# frozen_string_literal: true

require "swagger_helper"

RSpec.describe "Api::V1::RecipesController", type: :request, swagger_doc: SWAGGER_V1_DOC do
  include_context "sample recipes"

  let!(:user) { create(:user) }
  let(:Authorization) { authenticate_headers(user)["Authorization"] }

  path "/recipes/" do
    get "List of Recipes" do
      tags "Recipes API"

      consumes MIME_APPLICATION_JSON
      security [jwt: []]

      response "200", "returns all recipes" do
        schema \
          type: :array, items: { "$ref" => "#/components/schemas/recipe" }

        run_test! do
          expect(json_response(response).size).to eq(2)
        end
      end
    end

    get "List of Recipes with filters" do
      tags "Recipes API"

      consumes MIME_APPLICATION_JSON
      security [jwt: []]

      parameter name: :title, in: :query, type: :string

      response "200", "returns the filtered recipes when passing search query" do
        let(:title) { "recipe_one" }

        schema \
          type: :array, items: { "$ref" => "#/components/schemas/recipe" }

        run_test! do
          expect(json_response(response).dig(0, :title)).to eq("recipe_one")
        end
      end
    end
  end
end
