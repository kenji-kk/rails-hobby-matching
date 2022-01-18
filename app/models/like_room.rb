class LikeRoom < ApplicationRecord
  belongs_to :user
  belongs_to :hobby_room
  validates :user_id, uniqueness: { scope: :hobby_room_id }
end
