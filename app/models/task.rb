class Task < ApplicationRecord
  belongs_to :child

  scope :pending_tasks, ->(child_id) { where("child_id = ? AND status = ?", child_id, 'pending') }

   validates :title, presence: true, length: { minimum: 3 }
end
