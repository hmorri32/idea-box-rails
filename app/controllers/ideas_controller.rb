class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :destroy, :edit, :update]
  before_action :set_ideas, only: [:index]
  before_action :set_category, only: [:new, :create, :edit, :update]

  def index
  end

  def new
    @idea = Idea.new
  end

  def edit
  end

  def show
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      redirect_to category_idea_path(@category, @idea)
    else
      render :new
    end
  end

  def update
    @idea.update(idea_params)
    if @idea.save
      redirect_to category_idea_path(@idea.category, @idea)
    else
      render :edit
    end
  end

  def destroy
    @idea.delete
    redirect_to category_ideas_path(@idea.category)
  end

  private

  def set_ideas
    @ideas = Idea.all
  end

  def set_idea
    @idea = Idea.find(params[:id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def idea_params
    params.require(:idea).permit(:title, :body, :category_id)
  end
end
