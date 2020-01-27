class User::PostsController < ApplicationController
  def new
      
  end

  def create
      @post = Post.new(post_params)
      @post.user_id = current_user.id
      @post.save
      redirect_to root_path
  end

  def index
      @posts = Post.where(is_deleted: nil)
      #@user = current_user.id
      #@image = @user.image
      @post = Post.new
      @post.post_images.build
  end

  def show
  	  @post = Post.find(params[:id])
      @comment = Comment.new
      @favorite = Favorite.new
  end

  def hide
      @post = Post.find(params[:id])
      @post.update(is_deleted: true)
      redirect_to root_path
  end
  private

  def post_params
      params.require(:post).permit(:body, :user_id, :is_deleted, post_images_images: [])
  end
end