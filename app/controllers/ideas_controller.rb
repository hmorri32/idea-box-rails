class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :destroy, :edit, :update]

  def index
    @ideas = Idea.all
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
      redirect_to idea_path(@idea)
    else
      render :new
    end
  end

  def update
    @idea.update(idea_params)
    if @idea.save
      redirect_to idea_path(@idea)
    else
      render :edit
    end
  end

  def destroy
    @idea.delete
    redirect_to ideas_path
  end

  private

  def set_idea
    @idea = Idea.find(params[:id])
  end

  def idea_params
    params.require(:idea).permit(:title, :body, :category_id)
  end
end
