class Task < ApplicationRecord
  belongs_to :children
  validates :title, :description, presence: true
end
