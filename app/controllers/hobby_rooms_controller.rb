class HobbyRoomsController < ApplicationController
  before_action :logged_in_user

  def index
    @hobby_room = HobbyRoom.new
    @hobby_rooms = HobbyRoom.all
  end

  def create
    @hobby_room = HobbyRoom.new(hobby_room_params)
    if @hobby_room.save
      @hobby_room.exist_users << current_user
      flash[:success] = "趣味会話ルームの作成に成功しました。"
      redirect_to hobby_rooms_path
    else
      @hobby_rooms = HobbyRoom.all
      render 'index'
    end
  end

  def show
    @hobby_room = HobbyRoom.find(params[:id])
    @users = @hobby_room.exist_users
  end

  def join
    @hobby_room = HobbyRoom.find(params[:room][:room_id])
    @hobby_room.exist_users << current_user
    flash[:success] = "『#{@hobby_room.title}』の部屋に参加しました。" 
    redirect_to "/hobby_rooms/chat/#{@hobby_room.id}"
  end

  def withdrawal
    @hobby_room = HobbyRoom.find(params[:room][:room_id])
    @hobby_room.hobby_room_users.find_by(user_id: current_user.id).destroy
    flash[:success] = "『#{@hobby_room.title}』の部屋から退会しました。"
    redirect_to @hobby_room 
  end

  def chat_group
    @group_chat = GroupChat.new
    @hobby_room = HobbyRoom.find(params[:id])
    @chats = @hobby_room.group_chats
  end

  private

    def hobby_room_params
      params.require(:hobby_room).permit(:genre, :title, :description, :user_id)
    end
end
