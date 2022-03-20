# frozen_string_literal: true

require "rails_helper"

RSpec.describe Ingredients::IndexQuery do
  include_context "sample recipes"

  describe "#call" do
    context "search by title" do
      context "when title matches" do
        let(:search_params) { { title: "ingredient_one" } }

        it "returns the searched result" do
          expect(subject.call(search_params)).to eq(recipe_one.ingredients)
        end
      end

      context "when title does not match" do
        let(:search_params) { { title: "ingredient_none" } }

        it "returns no record" do
          expect(subject.call(search_params)).to be_blank
        end
      end
    end
  end
end
