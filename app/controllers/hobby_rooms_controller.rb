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



  private

    def hobby_room_params
      params.require(:hobby_room).permit(:genre, :title, :description, :user_id)
    end
end
