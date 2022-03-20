# frozen_string_literal: true

class Api::V1::RecipesController < Api::BaseController
  before_action :authorize_request

  # GET /recipes
  def index
    recipes = paginate Recipes::IndexQuery
              .new(Recipe.includes(:author))
              .call(search_params)

    render json: recipes
  end

  private

    def search_params
      params.permit(:title, :category, :author)
    end
end
