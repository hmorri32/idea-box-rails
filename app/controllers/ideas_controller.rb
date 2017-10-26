class IdeasController < ApplicationController
  before_action :set_idea,  only: [:show, :destroy, :edit, :update]
  before_action :set_ideas, only: [:index]

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
    @idea = current_user.ideas.new(idea_params)
    @idea.save ? redirect_to(user_idea_path(current_user, @idea)) : render(:new)
  end

  def update
    @idea.update(idea_params)
    @idea.save ? redirect_to(user_idea_path(current_user, @idea)) : render(:edit)
  end

  def destroy
    @idea.delete
    redirect_to user_ideas_path(current_user)
  end

  private

  def set_ideas
    @ideas = Idea.all
  end

  def set_idea
    @idea = Idea.find(params[:id])
  end

  def idea_params
    params.require(:idea).permit(:title, :body, :category_id)
  end
end
