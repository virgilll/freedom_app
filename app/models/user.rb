class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :transactions, dependent: :destroy
  # Not useful for now, but if we add other coins it will
  # has_many :coins, through: :transactions

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :card_info, presence: true
  validates :card_info, uniqueness: true, length: { minimum: 16 }
  validates :card_info, numericality: true

end
