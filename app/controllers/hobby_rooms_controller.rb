class HobbyRoomsController < ApplicationController

  def index
    @hobby_room = HobbyRoom.new
    @hobby_rooms = HobbyRoom.all
  end

  def create
    @hobby_room = HobbyRoom.new(hobby_room_params)
    if @hobby_room.save
      @hobby_room.exist_users << current_user
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
    redirect_to "/hobby_rooms/chat/#{@hobby_room.id}"
  end

  def withdrawal
    @hobby_room = HobbyRoom.find(params[:room][:room_id])
    @hobby_room.hobby_room_users.find_by(user_id: current_user.id).destroy
    redirect_to @hobby_room 
  end

  def chat_group
    @hobby_room = HobbyRoom.find(params[:id])
  end

  private

    def hobby_room_params
      params.require(:hobby_room).permit(:genre, :title, :description, :user_id)
    end
end
