class User::FavoritesController < ApplicationController
  before_action :post_params
	def create
  	  #@post = Post.find(params[:post_id])
      favorite = current_user.favorites.new(post_id: @post.id)
      favorite.save
      #render :favorite
      #redirect_to user_post_path(@post)
  end

  def destroy
  	  #@post = Post.find(params[:post_id])
  	  favorite = current_user.favorites.find_by(post_id: @post.id)
  	  favorite.destroy
      #render :unfavorite
  	  #redirect_to user_post_path(@post)
  end


  def post_params
    @post = Post.find(params[:post_id])
    #@id_name = "#favorite-link-#{@post.id}"
  end
end 
