class Coin < ApplicationRecord
  has_many :transactions
  validates :current_price, numericality: true
  validates :current_price, presence: true
  validates :description, presence: true
  validates :ticker, presence: true
def self.bitcoin_price
  50000
end
end
