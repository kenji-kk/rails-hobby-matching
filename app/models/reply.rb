class Reply < ApplicationRecord
  belongs_to :group_chat
  validates :content, presence: true, length: { maximum: 200}
end
