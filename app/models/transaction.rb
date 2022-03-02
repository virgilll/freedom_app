class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :coin
  validates :amount, presence: true
  validates :amount, numericality: true
  validates :transaction_date, presence: true
  validates :description, presence: true
  validates :description, length: { minimum: 3 }
  # validates :coin_amount, numericality: true
  # validates :rounded_amount, numericality: true
end
