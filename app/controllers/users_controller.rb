require "open-uri"

class UsersController < ApplicationController
  def dashboard
    @transactions = Transaction.where(user: current_user)
    @invested_amount = @transactions.sum(:rounded_amount).round(2)
    @coin_balance = @transactions.sum(:coin_amount) #sum coin amnt of transactions
    @dollar_balance = (@coin_balance * Coin.current_price).round(2)
    @earnings = (@dollar_balance - @invested_amount).round(2)

    url = "https://api.coingecko.com/api/v3/coins/bitcoin/market_chart?vs_currency=usd&days=1825&interval=monthly"
    historical_price = URI.open(url).read
    data = JSON.parse(historical_price)
    @final_data = data["prices"].map do |date_and_price|
      date = date_and_price[0]
      price = date_and_price[1]
      formatted_date = Time.at(date/1000.0)
      [formatted_date, price]
    end
  end

  def show
  end

  def information
  end

end
