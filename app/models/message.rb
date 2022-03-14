class Message < ApplicationRecord
  belongs_to :child
  belongs_to :notification

  scope :unread, ->(child_id) { where("child_id = ? AND read = ?", child_id, false).order(created_at: :desc) }

end
