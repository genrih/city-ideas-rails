class LikesController < ApplicationController
  before_action :set_idea, only: [:create]

  def create
    authorize! :like, :idea

    if current_user.votes.up.for_type(Idea).votables.map(&:id).include?(@idea.id)
      message = 'You have already liked idea'
    else
      current_user.likes @idea
      message = 'You have liked the idea'
    end
    respond_to do |format|
      format.html { redirect_to @idea, notice: message }
    end

    # respond_to do |format|
    #   format.js { render :show, status: :created, location: @idea }
    # end
  end

  private

  def set_idea
    @idea = Idea.friendly.find(params[:idea_id])
  end
end
