# frozen_string_literal: true

class Recipes::SaveService < ApplicationService
  def initialize(params:)
    @params = params
  end

  def call
    recipe = Recipe.find_or_initialize_by(title: params[:title])
    recipe.update!(
      title: params[:title],
      cook_time: params[:cook_time],
      prep_time: params[:prep_time],
      ratings: params[:ratings],
      cuisine: params[:cuisine],
      category: params[:category],
      image: params[:image],
      author: author,
      ingredients: ingredients
    )
  end

  private

    attr_reader :params

    def author
      Author.find_or_initialize_by(name: params[:author])
    end

    def ingredients
      params[:ingredients].uniq.map do |ingredient|
        Ingredient.find_or_initialize_by(title: ingredient)
      end
    end
end
