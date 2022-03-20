# frozen_string_literal: true

# == Schema Information
#
# Table name: authors
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_authors_on_name  (name) UNIQUE
#
require "rails_helper"

RSpec.describe Author, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }

    context "uniqueness" do
      subject { build(:author) }
      it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
    end
  end

  describe "relationships" do
    it { is_expected.to have_many(:recipes).dependent(:destroy) }
  end
end
