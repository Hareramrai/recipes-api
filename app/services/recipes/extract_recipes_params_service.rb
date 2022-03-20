# frozen_string_literal: true

class Recipes::ExtractRecipesParamsService < ApplicationService
  def initialize(file_url:)
    @file_url = file_url
  end

  def call
    JSON.parse(recipes_file_content, symbolize_names: true)
  end

  private

    attr_reader :file_url

    def recipes_file_content
      Recipes::DownloaderService.call(file_url: file_url)
    end
end
