# frozen_string_literal: true

class Recipes::IndexQuery
  def initialize(relation = Recipe.all)
    @relation = relation
  end

  def call(search_params)
    search_by_title(search_params) if search_params[:title].present?
    search_by_category(search_params) if search_params[:category].present?
    search_by_author(search_params) if search_params[:author].present?

    @relation
  end

  private

    def search_by_title(search_params)
      @relation = @relation.where("title LIKE ?", "%#{search_params[:title]}%")
    end

    def search_by_category(search_params)
      @relation = @relation.where(category: search_params[:category])
    end

    def search_by_author(search_params)
      @relation = @relation
                  .joins(:author)
                  .where(authors: { name: search_params[:author] })
    end
end
