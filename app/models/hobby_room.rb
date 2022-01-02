class HobbyRoom < ApplicationRecord
  belongs_to :user
  has_many :hobby_room_users
  has_many :exist_users, through: :hobby_room_users, source: :user
end
