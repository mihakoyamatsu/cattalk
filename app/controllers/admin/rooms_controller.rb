class Admin::RoomsController < ApplicationController
  def index
  	@rooms = Room.all
  	#@messages = DirectMessage.all
    @entries = Entry.all.select(:room_id,:user_id,:is_deleted,:created_at,:updated_at).distinct.order(room_id: :desc)
    @allEntry = []
    @entries.each do |entry|
      @allEntry << entry.user
    end
    #@anotherEntries = Entry.where(room_id: myRoomIds).where.not(user_id: current_user.id).order(created_at: :desc) #where~~かつwhere.not~~~~ という意味

  end

  def show
    @room = Room.find(params[:id])
    @messages = DirectMessage.where(room_id: @room).order(updated_at: :desc)

  end 

  def hide
  	@room = Room.find(params[:id])
  	@room.update(is_deleted: true)
  	redirect_to admin_rooms_path
  end
end
