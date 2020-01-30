class User::CommentsController < ApplicationController
  before_action :ensure_correct_user, only: [:create, :hide ]
  def create
  	@post = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    comment.post_id = @post.id
    comment.save!
    redirect_to user_post_path(@post)
  end

  def hide
    @comment = Comment.find(params[:id])
    @comment.update(is_deleted: true)
    flash[:notice]= 'コメントを削除しました'
    redirect_to user_post_path(@comment.post.id)
  end

  def ensure_correct_user
      @post = Post.find(params[:id])
    if @post.comments.user != current_user
      redirect_to root_path
    end
  end

  private
  def comment_params
  	  params.require(:comment).permit(:user_id, :post_id, :comment, :is_deleted)
  end
end
