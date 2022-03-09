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

    #       "https://3jvichlsm2.execute-api.eu-west-2.amazonaws.com/dev/calculate/api?principal=100&interestRate=0.15&monthlyAmount=400&termLength=10"
    # url = "https://3jvichlsm2.execute-api.eu-west-2.amazonaws.com/dev/calculate/api?principal=100&interestRate=10&monthlyAmount=400&termLength=0.15"
    url = "https://3jvichlsm2.execute-api.eu-west-2.amazonaws.com/dev/calculate/api?principal=#{params[:principal]}&interestRate=#{params[:interest]}&monthlyAmount=#{params[:monthly_contributions]}&termLength=#{params[:years]}"
    compound_link = URI.open(url).read
    @compound_calculation = JSON.parse(compound_link)
  end

  def card
  end

  def show
  end

  def information
  end

end
