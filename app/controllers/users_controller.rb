class UsersController < ApplicationController
  def dashboard
    @transactions = Transaction.where(user: current_user)
    @balance = 0
    @transactions.each do |transaction|
      @balance += transaction.rounded_amount.to_f.round(2)
    end
    @earnings = (@balance * Coin.bitcoin_price)
    #@earnings = Balance of roundup x (current price of btc - avg price of btc)
    # static
  end


  def show
  end

end
