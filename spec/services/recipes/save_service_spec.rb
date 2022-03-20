# frozen_string_literal: true

require "rails_helper"

RSpec.describe Recipes::SaveService do
  include_context "json sample recipes"

  subject { described_class.call(params: json_recipes[0]) }

  describe ".call" do
    it "creates recipe, ingredients & author by saving the params" do
      expect { subject }.to change { Recipe.count }.by(1)
                                                   .and change { Ingredient.count }.by(8)
                                                                                   .and change { Author.count }.by(1)
    end
  end
end
