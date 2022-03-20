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
class Ingredient < ApplicationRecord
  has_and_belongs_to_many :recipes

  validates :title, presence: true, uniqueness: { case_sensitive: false }
end
