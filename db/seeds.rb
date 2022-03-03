Transaction.destroy_all
Coin.destroy_all
#User.destroy_all


#harry = User.create!(first_name: "Harry", last_name: "Potter", email: "hpotter@gmail.com", card_info: 4744721027068240, password: "password")
bitcoin = Coin.create!(name: "Bitcoin", current_price: 0, description: "The most famous coin", ticker: "BTC")
#25.times do
# rounding_amount = rand.round(2)
  #Transaction.create!(
    # amount: Faker::Number.within(range: 1..3_000_000),
    #description: Faker::Quote.famous_last_words,
    #transaction_date: Faker::Date.between(from: '2022-02-23', to: '2022-05-25'),
    #rounded_amount: rounding_amount,
  # coin_amount: rounding_amount / bitcoin_price,

  #  user: harry,
  #   coin: bitcoin
#end
#
