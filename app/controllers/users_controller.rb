require "open-uri"

class UsersController < ApplicationController
  def dashboard
    @transactions = Transaction.where(user: current_user)
    @invested_amount = @transactions.sum(:rounded_amount).round(2)
    @coin_balance = @transactions.sum(:coin_amount) #sum coin amnt of transactions
    @dollar_balance = (@coin_balance * Coin.current_price).round(2)
    @earnings = (@dollar_balance - @invested_amount).round(2)
    @initial_amount = @dollar_balance - @earnings
    @earnings_percentage = ((@dollar_balance - @initial_amount) / @initial_amount)
    @final_data = Coin.graph
  end

  def show
  end

  def information
  end

end
