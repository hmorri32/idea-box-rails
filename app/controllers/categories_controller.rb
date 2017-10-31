class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    ids = current_user.ideas.map { |idea| idea.category.id }
    # @category = Category.find(ids)
  end
end
