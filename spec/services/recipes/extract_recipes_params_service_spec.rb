# frozen_string_literal: true

require "rails_helper"

RSpec.describe Recipes::ExtractRecipesParamsService do
  include_context "json sample recipes"

  let(:file_url) { Recipes::ImportService::RECIPES_FILE_URL }

  subject { described_class.call(file_url: file_url) }

  describe ".call" do
    let(:file_resource) { file_fixture("recipes-english.json.gz") }

    before do
      stub_request(:get, file_url)
        .with(
          headers: {
            "Accept" => "*/*",
            "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
            "User-Agent" => "Ruby",
          }
        )
        .to_return(status: 200, body: file_resource, headers: {})
    end

    it "returns parse json recipes object" do
      expect(subject).to eq(json_recipes)
    end
  end
end
