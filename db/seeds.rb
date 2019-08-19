# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

orders = (1..100).to_a.map do |num|
  Order.create!(
    ref: SecureRandom.hex(10),
    order_type: 'sale',
    amount: rand(5.0..75.0).round(2),
    ordered_at: [1,2,3,4,5].sample.days.ago,
    email: "customer#{num}@email.com",
    name: "Customer #{num}"
  )
end

refunds = orders.shuffle.first(10).map do |order|
  Order.create!(
    ref: order.ref,
    order_type: 'refund',
    amount: -1.0 * order.amount,
    ordered_at: order.ordered_at + 1.day,
    email: order.email,
    name: order.name
  )
end