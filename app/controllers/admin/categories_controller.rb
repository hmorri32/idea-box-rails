class Admin::CategoriesController < Admin::BaseController
  before_action :set_category,   only: [:show, :edit, :destroy, :update]
  before_action :set_categories, only: [:index]

  def index
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Successfully created new category."
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @category.update(category_params)
    if @category.save
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    @category.delete
    redirect_to admin_categories_path
  end

  private

  def set_categories
    @categories = Category.all
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title)
  end
end