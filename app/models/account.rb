class Account < ApplicationRecord
  belongs_to :child
  has_many :transactions
end
