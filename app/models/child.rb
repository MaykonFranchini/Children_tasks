class Child < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :user
  has_many :account
  has_many :Subscriptions
  has_many :transactions ,through: :account
  has_many :tasks, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true
  validates :user_id, presence: { message: "Please insert the Parents reference number. You can find this at Parents dashboard." }
  validates :first_name, :last_name, :email, :date_of_birth, :presence => true

  def card_name
    first_name.upcase + " " + last_name[0].upcase + "."
  end
end
