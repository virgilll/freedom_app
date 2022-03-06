class UsersController < ApplicationController
  def dashboard
    @transactions = Transaction.where(user: current_user)
    @invested_amount = @transactions.sum(:rounded_amount).round(2)
    @coin_balance = @transactions.sum(:coin_amount) #sum coin amnt of transactions
    @dollar_balance = (@coin_balance * Coin.bitcoin_price).round(2)
    @earnings = (@dollar_balance - @invested_amount).round(2)
    #@earnings = Balance of roundup x (current price of btc - avg price of btc)
    # static
  end


  def show
  end

  def information
  end

end
