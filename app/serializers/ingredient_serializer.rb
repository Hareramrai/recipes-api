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
class IngredientSerializer < ActiveModel::Serializer
  attributes :id, :title
end
