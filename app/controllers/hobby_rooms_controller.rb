class HobbyRoomsController < ApplicationController

  def index
    @hobby_room = HobbyRoom.new
    @hobby_rooms = HobbyRoom.all
  end

  def create
    @hobby_room = HobbyRoom.new(hobby_room_params)
    if @hobby_room.save
      redirect_to hobby_rooms_index_path
    else
      render 'index'
    end
  end



  private

    def hobby_room_params
      params.require(:hobby_room).permit(:genre, :title, :description, :user_id)
    end
end
