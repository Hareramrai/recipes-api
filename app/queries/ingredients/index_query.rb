# frozen_string_literal: true

class Ingredients::IndexQuery
  def initialize(relation = Ingredient.all)
    @relation = relation
  end

  def call(search_params)
    search_by_title(search_params) if search_params[:title].present?

    @relation
  end

  private

    def search_by_title(search_params)
      @relation = @relation.where("title LIKE ?", "%#{search_params[:title]}%")
    end
end
