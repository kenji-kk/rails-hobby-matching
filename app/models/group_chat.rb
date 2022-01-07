class GroupChat < ApplicationRecord
  belongs_to :hobby_room
  has_many :replys
  validates :content, presence: true, length: { maximum: 300 }
end
