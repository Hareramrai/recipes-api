# frozen_string_literal: true

# == Schema Information
#
# Table name: ingredients
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_ingredients_on_title  (title) UNIQUE
#
require "rails_helper"

RSpec.describe Ingredient, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }

    context "uniqueness" do
      subject { build(:ingredient) }
      it { is_expected.to validate_uniqueness_of(:title).case_insensitive }
    end
  end

  describe "relationships" do
    it { is_expected.to have_and_belong_to_many(:recipes) }
  end
end
