class Task < ApplicationRecord
  belongs_to :child

   validates :title, presence: true, length: { minimum: 3 }
end
