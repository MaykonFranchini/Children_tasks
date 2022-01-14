class Notification < ApplicationRecord
  belongs_to :child
  has_many :messages
end
