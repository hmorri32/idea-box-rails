class IdeasController < ApplicationController
  # before_action :set_idea,  only: [:destroy, :edit, :update]
  # before_action :set_ideas, only: [:index]

  def index
    @ideas = current_user.ideas
  end

  def new
    @idea = Idea.new
  end

  def edit
  end

  def show
    @idea = current_user.ideas.find(params[:id])
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
    @idea = current_user.ideas.find(params[:id])
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
