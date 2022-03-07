class Coin < ApplicationRecord
  has_many :transactions
  validates :description, presence: true
  validates :ticker, presence: true

  def self.current_price
    url = 'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd&include_24hr_change=true'
    user_serialized = URI.open(url).read
    user = JSON.parse(user_serialized)
    "Bitcoin Price: #{user["bitcoin"]["usd"]} - Bitcoin % Change(24hr): #{user["bitcoin"]["usd_24h_change"]}"
    return user["bitcoin"]["usd"].to_f
  end

  def self.graph
    url = "https://api.coingecko.com/api/v3/coins/bitcoin/market_chart?vs_currency=usd&days=1825&interval=monthly"
    historical_price = URI.open(url).read
    data = JSON.parse(historical_price)
    final_data = data["prices"].map do |date_and_price|
      date = date_and_price[0]
      price = date_and_price[1]
      formatted_date = Time.at(date/1000.0)
      [formatted_date, price]
    end
    return final_data
  end
end
