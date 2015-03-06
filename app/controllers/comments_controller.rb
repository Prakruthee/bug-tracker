class CommentsController < ApplicationController

  def show
    @issue = Issue.find(params[:id])
    @comments = Comment.where(issue_id: @issue.id)
  end

  def update
    @issue = Issue.find(params[:id])
    comment = Comment.new(params.require(:comment).permit(:comment_description))
    if comment.comment_description.present?
      comment.issue_id = @issue.id
      comment.user_id = current_user.id
      comment.save
    end
    comments = Comment.all.where(issue_id: params[:id].to_i)
    redirect_to comment_path(@issue)
  end

end


