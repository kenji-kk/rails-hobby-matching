class HobbyRoomUser < ApplicationRecord
  belongs_to :user
  belongs_to :hobby_room
end
