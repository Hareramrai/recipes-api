# frozen_string_literal: true

class Api::V1::Users::RecipeRecommendationsController < Api::BaseController
  before_action :authorize_request

  # GET /users/:id/recipe_recommendations
  def index
    recipes = paginate current_user.recommended_recipes.page params[:page]

    render json: recipes
  end
end
