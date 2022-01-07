class HobbyRoom < ApplicationRecord
  belongs_to :user
  has_many :hobby_room_users
  has_many :exist_users, through: :hobby_room_users, source: :user
  has_many :group_chats
  validates :genre, presence: true, length: { maximum: 50}
  validates :title, presence: true, length: { maximum: 100}
  validates :description, presence: true, length: { maximum: 300 }
  
end
