class Coin < ApplicationRecord
  has_many :transactions
  validates :current_price, numericality: true
  validates :current_price, presence: true
  validates :description, presence: true
  validates :ticker, presence: true
  def self.bitcoin_price
    Coin.find_by(name: "Bitcoin").current_price
  end
end
