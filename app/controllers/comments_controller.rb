class CommentsController < ApplicationController
  before_action :find_discussion
  before_action :authenticate_user!

  def create
    @project = Project.find @discussion.project_id
    @comment = @discussion.comments.new comment_params
    if @comment.save
      redirect_to @project, notice: "Comment created successfully"
    else
      render "projects/show/"
    end
  end

  def destroy
    @project = Project.find @discussion.project_id
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to @project
    flash[:success] = "Comment was successfully edited."
  end

  def edit
    @comment = Comment.find params[:id]
  end

  def update
    @comment = Comment.find params[:id]
    @discussion = Discussion.find @comment.discussion_id
    if @comment.update comment_params
      redirect_to project_path(@discussion.project_id)
      flash[:success] = "Comment was successfully edited."
    else
      render :edit
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_discussion
    @discussion = Discussion.find params[:discussion_id]
  end

end
