class User::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

  end

  def edit
  end

  def update
  end

  def favorites
  end
end
