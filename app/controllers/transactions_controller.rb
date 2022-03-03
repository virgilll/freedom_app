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
    @transaction.amount = @coin_amount
    # TODO: calculate rounded amount and coin amount
    # Rounded amount: ceiling - amount
    # rounded_amount = amount.ceil - amount
    # coin_amount: rounded / coin price

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
