class GroupChat < ApplicationRecord
  belongs_to :hobby_room
  has_many :replys, dependent: :destroy
  validates :content, presence: true, length: { maximum: 300 }
end
