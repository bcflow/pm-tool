class MembersController < ApplicationController

	  before_action :authenticate_user!

  def create
    project  = Project.find params[:project_id]
    member      = project.members.new
    like.user = current_user
    if like.save
      redirect_to project, notice: "Member added!"
    else
      redirect_to project, alert: "You cannot do this."
    end
  end

  def destroy
    project = Project.find params[:project_id]
    member    = project.members.find params[:id]
    if member.destroy
      redirect_to project, notice: "UnLiked!"
    else
      redirect_to project, alert: "Can't UnLike!"
    end
  end
end
