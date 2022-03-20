# frozen_string_literal: true

class Api::V1::Users::UserIngredientsController < Api::BaseController
  before_action :authorize_request

  # GET /users/:id/user_ingredients
  def index
    ingredients = paginate current_user.ingredients.page params[:page]

    render json: ingredients
  end

  def create
    current_user.ingredient_ids = (
      current_user.ingredient_ids << user_ingredient_params[:ingredient_id]
    ).uniq

    render json: { ingredient_ids: current_user.ingredient_ids }, status: :created
  end

  def destroy
    current_user.ingredient_ids -= [params[:id].to_i]

    head :no_content
  end

  private

    def user_ingredient_params
      params
        .require(:user_ingredient)
        .permit(:ingredient_id)
    end
end
