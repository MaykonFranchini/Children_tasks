class Child < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :users
  has_many :tasks

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
