class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.user = current_user
    @transaction.coin = Coin.first
    @rounded_amount = @transaction.amount.ceil
    @coin_amount = @rounded_amount / Coin.bitcoin_price.to_f
    @whole_number = @transaction.amount.ceil


    # CREATE A TRANSACTION AND THEN CALCULATE THE ROUNDED AMOUNT, HOW MUCH THE ROUNDED AMOUNT IS WORTH IN BITCOIN
    #  HOW MUCH BITCOIN I HAVE, HOW MANY DOLLARS HAVE SPENT ON BUYING IT



    if @transaction.save
      redirect_to dashboard_path, notice: "New transaction added"
    else
      # raise
      render :new
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:amount, :transaction_date, :description)
  end

end
