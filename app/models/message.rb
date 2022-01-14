class Message < ApplicationRecord
  belongs_to :child
  belongs_to :notification
end
