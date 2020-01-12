class User::PostsController < ApplicationController
  def new
      @post = Post.new
  end

  def create
      @post = Post.new(post_params)
      #@post_image = @post.@post_image.build
      @post.save

      redirect_to root_path

  end

  def index
      @posts = Post.all
      #@user = User.find(params[:id])
  end

  def show
  	  @post = Post.find(params[:id])
  end

  private

  def post_params
      params.require(:post).permit(:body)
  end

  def post_image_params
  	  params.require(:post_image).permit(:post_image)
  	
  end

end
