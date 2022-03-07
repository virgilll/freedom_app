Transaction.destroy_all
Coin.destroy_all
User.destroy_all



bitcoin_2020_price = [Coin.current_price, 9000, 50000, 40000, 22000, 28000, 32000, 11000, 34000, 42000]

harry = User.create!(first_name: "Harry", last_name: "Potter", email: "hpotter@gmail.com", card_info: 4744721027068240, password: "password")
bitcoin = Coin.create!(name: "Bitcoin", description: "The most famous coin", ticker: "BTC")

250.times do
  amount = rand(1..100) + rand.round(2)
  rounding_amount = (amount.ceil - amount).round(2)
  Transaction.create!(
    amount: amount,
    description: Faker::Commerce.department(max: 1),
    transaction_date: Faker::Date.between(from: '2021-02-23', to: '2021-05-25'),
    rounded_amount: (amount.ceil - amount).round(2),
    coin_amount: rounding_amount / bitcoin_2020_price.sample,
    user: harry,
    coin: bitcoin)
 end
