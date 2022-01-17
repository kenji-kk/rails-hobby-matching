class LikeRoom < ApplicationRecord
  belongs_to :user
  belongs_to :hobby_room
  validates :hobby_room_id, uniqueness: { scope: :user_id }
end
