# frozen_string_literal: true

class Api::V1::IngredientsController < Api::BaseController
  before_action :authorize_request

  # GET /ingredients
  def index
    ingredients = paginate Ingredients::IndexQuery.new.call(search_params)

    render json: ingredients
  end

  private

    def search_params
      params.permit(:title)
    end
end
