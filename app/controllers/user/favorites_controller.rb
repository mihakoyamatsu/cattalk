class User::FavoritesController < ApplicationController
  before_action :post_params
	def create
      favorite = current_user.favorites.new(post_id: @post.id)
      favorite.save
  end

  def destroy
  	  favorite = current_user.favorites.find_by(post_id: @post.id)
  	  favorite.destroy
  end


  def post_params
    @post = Post.find(params[:post_id])
  end
end 
