# frozen_string_literal: true

# == Schema Information
#
# Table name: recipes
#
#  id         :bigint           not null, primary key
#  category   :string
#  cook_time  :integer          default(0)
#  cuisine    :string
#  image      :string
#  prep_time  :integer          default(0)
#  ratings    :float            default(0.0)
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :bigint
#
# Indexes
#
#  index_recipes_on_author_id  (author_id)
#  index_recipes_on_title      (title) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (author_id => authors.id)
#
require "rails_helper"

RSpec.describe Recipe, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_numericality_of(:cook_time).is_greater_than(0) }
    it { is_expected.to validate_numericality_of(:prep_time).is_greater_than(0) }

    context "uniqueness" do
      subject { build(:ingredient) }
      it { is_expected.to validate_uniqueness_of(:title).case_insensitive }
    end
  end

  describe "relationships" do
    it { is_expected.to have_and_belong_to_many(:ingredients) }
    it { is_expected.to belong_to(:author) }
  end
end
