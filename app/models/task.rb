class Task < ApplicationRecord
  belongs_to :child

   validates :title, uniqueness: true, length: { minimum: 3 }
end
