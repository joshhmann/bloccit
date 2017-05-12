class CommentsController < ApplicationController
  
  before_action :require_sign_in
  
  before_action :authorize_user, only: [:destroy]
  
  def create
    if params[:post_id]
      commentable =  Post.find(params[:post_id])
      redirect = [commentable.topic, commentable]
    else 
      commentable = Topic.find(params[:topic_id])
      redirect = commentable 
    end
    comment = Comment.new(comment_params)
    comment.commentable = commentable
    comment.user = current_user
    
    if comment.save
      flash[:notice] ="Comment saved successfully."
      
      redirect_to redirect 
    else
      flash[:alert] = "Comment failed to save."
      
      redirect_to redirect 
    end
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    comment = @post.comments.find(params[:id])
    
    if comment.destroy
      flash[:notice] = "comment was deleted successfully."
      redirect_to [@post.topic, @post]
    else
      flash[:alert] = "comment couldn't be deleted. Try again."
      redirect_to [@post.topic, @post]
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:body)
  end
  
  def authorize_user
    comment = Comment.find(params[:id])
    unless current_user == comment.user || current_user.admin?
      flash[:alert] = "You do not have permission to delete at comment."
      redirect_to [comment.post.topic, comment.post]
    end
  end
end
