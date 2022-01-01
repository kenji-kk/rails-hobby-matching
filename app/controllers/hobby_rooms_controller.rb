class HobbyRoomsController < ApplicationController

  def index
    @hobby_room = HobbyRoom.new
    @hobby_rooms = HobbyRoom.all
  end

  def create
  end
  
end
