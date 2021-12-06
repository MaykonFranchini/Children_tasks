class Child < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :user
  has_many :account
  has_many :transactions ,through: :account


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true
  validates :user_id, presence: { message: "Please insert the Parents reference number. You can find this at Parents dashboard." }
  validates :first_name, :last_name, :email, :date_of_birth, :presence => true
end
