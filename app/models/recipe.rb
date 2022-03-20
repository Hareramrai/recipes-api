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
class Recipe < ApplicationRecord
  has_and_belongs_to_many :ingredients
  belongs_to :author

  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :cook_time, numericality: { greater_than: 0 }
  validates :prep_time, numericality: { greater_than: 0 }
end
