class Transaction < ApplicationRecord
  belongs_to :account

  scope :list, ->(child_id) { where("account_id = ?", child_id ).order(created_at: :desc)}
end
