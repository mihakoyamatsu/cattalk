class User::RelationshipsController < ApplicationController
  before_action :user_params
	def create
    follow = current_user.following_relationships.build(follower_id: params[:user_id])
    follow.save!
  end

  def destroy
    follow = current_user.following_relationships.find_by(follower_id: params[:user_id])
    follow.destroy!
  end

  def user_params
    @user = User.find(params[:user_id])
  end
end
