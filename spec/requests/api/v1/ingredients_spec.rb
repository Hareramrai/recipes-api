# frozen_string_literal: true

require "swagger_helper"

RSpec.describe "Api::V1::IngredientsController", type: :request, swagger_doc: SWAGGER_V1_DOC do
  include_context "sample recipes"

  let!(:user) { create(:user) }
  let(:Authorization) { authenticate_headers(user)["Authorization"] }

  path "/ingredients/" do
    get "List of Ingredients" do
      tags "Ingredients API"

      consumes MIME_APPLICATION_JSON
      security [jwt: []]

      response "200", "returns all ingredients" do
        schema \
          type: :array, items: { "$ref" => "#/components/schemas/ingredient" }

        run_test! do
          expect(json_response(response).size).to eq(2)
        end
      end
    end

    get "List of ingredients with filters" do
      tags "Ingredients API"

      consumes MIME_APPLICATION_JSON
      security [jwt: []]
      parameter name: :title, in: :query, type: :string

      response "200", "returns the filtered ingredients when passing search query" do
        let(:title) { "ingredient_one" }

        schema \
          type: :array, items: { "$ref" => "#/components/schemas/ingredient" }

        run_test! do
          expect(json_response(response).dig(0, :title)).to eq("ingredient_one")
        end
      end
    end
  end
end
