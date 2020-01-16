class User::CommentsController < ApplicationController
  def create
  	@post = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    comment.post_id = @post.id
    comment.save
    redirect_to user_post_path(@post)
  end

  def correct_user
      @post = Post.find(params[:post_id])
      comment = Comment.find(params[:id])
      unless comment.user.id == current_user.id
        redirect_to user_post_path(@post)
      end
  end

  private
  def comment_params
  	  params.require(:comment).permit(:user_id, :post_id, :comment, :is_deleted)
  end
end
