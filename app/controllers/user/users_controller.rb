class User::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if @user.cats.exists?
    @cats = Cat.where(user_id:current_user.id)
    end
    @report = current_user.reporting_relationships.build(reported_user_id: @user.id)
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |currentuser|
        @userEntry.each do |user|
          if currentuser.room_id == user.room_id then
            @isRoom = true
            @roomId = currentuser.room_id
          end
        end
      end
    unless @isRoom
        @room = Room.new
        @entry = Entry.new
    end
    end
    #@roomId = (@user.entries.pluck(:room_id) & current_user.entries.pluck(:room_id)).first
    #@room, @entry = Room.new, Entry.new unless @roomId
  end

  def edit
    @user = User.find(params[:id])
    # @user.cats.each do |cat|
      # cat.cat_images.build
    # end
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to edit_user_user_path(current_user.id)
  end

  def favorites
    @favorites = Favorite.where(user_id:current_user.id)

  end
  
  def follows
    @user = User.find(params[:id])
  end

  def followers
    @user = User.find(params[:id])
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |currentuser|
        @userEntry.each do |user|
          if currentuser.room_id == user.room_id then
            @isRoom = true
            @roomId = currentuser.room_id
          end
        end
      end
    unless @isRoom
        @room = Room.new
        @entry = Entry.new
    end
    end
  end

  private

  def user_params
    params.require(:user).permit(:image, :name, :email, :introduce, :prefectures, :cities, :is_deleted,cats_attributes: [:id, :_destroy, :user_id,  :name, :sex, :age, :breed, :weight, :blood_type, :story, :purpose, :condition_sex, :condition_breed, :condition_age, :condition_blood_type, :condition_weight, :term, :note, :status, cat_images_images: []])
  end
end
