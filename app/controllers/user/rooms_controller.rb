class User::RoomsController < ApplicationController
  def index
    #チャット相手の名前で一覧表示するにはcurrent_user.rooms.allだと、room.name("DM")で表示させることになり、誰とのトークか見分けつかない。
    #entryは塊になって浮いてる状態なので、配列にするには、entryを一件ずつ取り出して、配列の箱に入れる。
    @currentEntries = current_user.entries
    myRoomIds = [] #配列が入る箱を作る
    @currentEntries.each do |entry| #カレントユーザーのentry 1件ずつだす
      myRoomIds << entry.room.id # << は、右辺のentry.room.idを左辺のmyRoomIdsの中に入れる
    end
    @anotherEntries = Entry.where(room_id: myRoomIds).where.not(user_id: current_user.id).order(created_at: :desc) #where~~かつwhere.not~~~~ という意味
  end

  def show
  	@room = Room.find(params[:id])
  	if Entry.where(:user_id => current_user.id, :room_id => @room.id).present?
  	  @direct_messages = @room.direct_messages
  	  @entries = @room.entries
  	else
  	  redirect_back(fallback_location: root_path)
    end
 
  end

  def create
    @room = Room.create(name: "DM")
    @entry1 = Entry.create(room_id:@room.id, user_id:current_user.id)
    @entry2 = Entry.create(params.require(:room).permit(:user_id).merge(:room_id => @room.id))
    redirect_to user_room_path(@room.id)
  end

  def hide
    @room = Room.find(params[:id])
    @room.update(is_deleted: true)
    redirect_to user_rooms_path
  end
end
