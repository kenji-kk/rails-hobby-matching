class Relationship < ApplicationRecord
  belogns_to :follower, class_name: "User"
  belogns_to :followed, class_name: "User"
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
