class Admin::UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def hide
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    flash[:notice] = "強制退会させました。"
    redirect_to admin_users_path
  end
end
