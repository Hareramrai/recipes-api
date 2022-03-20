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
FactoryBot.define do
  factory :ingredient do
    sequence :title do |n|
      "ingredient title#{n}"
    end
  end
end
