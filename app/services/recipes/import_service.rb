# frozen_string_literal: true

class Recipes::ImportService < ApplicationService
  RECIPES_FILE_URL = "https://d1sf7nqdl8wqk.cloudfront.net/recipes-english.json.gz"

  def call
    recipes_params.each do |recipe_params|
      Recipes::SaveService.call(params: recipe_params)
    rescue ActiveRecord::RecordInvalid => _e
      Rails.logger.debug { "Failed to save recipe #{recipe_params[:title]}" }
    end
  end

  private

    def recipes_params
      Recipes::ExtractRecipesParamsService.call(file_url: RECIPES_FILE_URL)
    end
end
