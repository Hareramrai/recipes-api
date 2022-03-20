# frozen_string_literal: true

require "rails_helper"

RSpec.describe Recipes::IndexQuery do
  include_context "sample recipes"

  describe "#call" do
    context "search by title" do
      context "when title matches" do
        let(:search_params) { { title: "recipe_one" } }

        it "returns the searched result" do
          expect(subject.call(search_params)).to eq([recipe_one])
        end
      end

      context "when title does not match" do
        let(:search_params) { { title: "recipe_none" } }

        it "returns no record" do
          expect(subject.call(search_params)).to be_blank
        end
      end
    end

    context "search by category" do
      context "when category matches" do
        let(:search_params) { { category: "pasta" } }

        it "returns the searched result" do
          expect(subject.call(search_params)).to eq([recipe_two])
        end
      end

      context "when category does not match" do
        let(:search_params) { { category: "naan" } }

        it "returns no record" do
          expect(subject.call(search_params)).to be_blank
        end
      end
    end

    context "search by author" do
      context "when author matches" do
        let(:author_name) { recipe_one.author.name }
        let(:search_params) { { author: author_name } }

        it "returns the searched result" do
          expect(subject.call(search_params)).to eq([recipe_one])
        end
      end

      context "when author does not match" do
        let(:search_params) { { author: "1233" } }

        it "returns no record" do
          expect(subject.call(search_params)).to be_blank
        end
      end
    end
  end
end
