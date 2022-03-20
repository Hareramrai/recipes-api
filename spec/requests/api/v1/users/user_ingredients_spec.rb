# frozen_string_literal: true

require "swagger_helper"

RSpec.describe "Api::V1::Users::UserIngredientsController", type: :request, swagger_doc: SWAGGER_V1_DOC do
  include_context "sample recipes"

  let!(:user) { create(:user) }
  let(:user_id) { user.id }
  let(:Authorization) { authenticate_headers(user)["Authorization"] }

  path "/users/{user_id}/user_ingredients/" do
    get "List of Ingredients" do
      tags "User Ingredients API"

      consumes MIME_APPLICATION_JSON
      security [jwt: []]
      parameter name: :user_id, in: :path, type: :string

      response "200", "returns all ingredients for a given user" do
        before { user.ingredients = Ingredient.all }

        schema \
          type: :array, items: { "$ref" => "#/components/schemas/ingredient" }

        run_test! do
          expect(json_response(response).size).to eq(2)
        end
      end
    end

    post "Add ingredient to user's list" do
      tags "User Ingredients API"

      consumes MIME_APPLICATION_JSON
      security [jwt: []]

      parameter name: :user_id, in: :path, type: :string
      parameter in: :body, name: :params, schema: { "$ref" => "#/components/schemas/new_user_ingredient" }

      response "201", "adds the ingredient & retuns all ingredient_ids" do
        let(:ingredient) { create(:ingredient) }

        let(:params) { { user_ingredient: { ingredient_id: ingredient.id } } }

        schema \
          type: :object, properties: { ingredient_ids: { type: :array, items: { type: :integer } } }

        run_test! do
          expect(json_response(response)[:ingredient_ids].size).to eq(1)
        end
      end
    end
  end

  path "/users/{user_id}/user_ingredients/{id}" do
    delete "Remove ingredient from user list" do
      tags "User Ingredients API"

      consumes MIME_APPLICATION_JSON
      security [jwt: []]

      parameter name: :user_id, in: :path, type: :string
      parameter name: :id, in: :path, type: :string

      response "204", "remove the given ingredient id" do
        let(:id) { Ingredient.last.id }

        before { user.ingredients = Ingredient.all }

        run_test! do
          expect(user.reload.ingredient_ids).not_to include(id)
        end
      end
    end
  end
end
