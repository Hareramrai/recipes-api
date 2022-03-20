# frozen_string_literal: true

require "rails_helper"

RSpec.describe Recipes::ImportService do
  include_context "json sample recipes"

  subject { described_class.call }

  describe ".call" do
    it "calls ExtractRecipesParamsService & saves all recipes with ingredients & author " do
      expect(Recipes::ExtractRecipesParamsService).to receive(:call).and_return(json_recipes)

      expect { subject }.to change { Recipe.count }.by(2)
                                                   .and change { Ingredient.count }.by(15)
                                                                                   .and change { Author.count }.by(2)
    end
  end
end
