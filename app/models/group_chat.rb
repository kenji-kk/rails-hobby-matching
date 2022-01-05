class GroupChat < ApplicationRecord
  belongs_to :hobby_room
  has_many :replys
end
