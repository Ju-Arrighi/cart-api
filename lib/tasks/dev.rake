require 'faker'

namespace :dev do
  desc 'Configure development setup'
  task setup: :environment do
    puts 'Creating Invoices...'
    20.times do
      Invoice.create!(
        subtotal: 0,
        total: 0
      )
    end
    puts 'Invoices created successfuly'
    ####################################
    puts 'Creating Products'
    50.times do
      Product.create!(
        product_type: 0,
        name: Faker::Commerce.product_name,
        price: Faker::Commerce.price,
        stock: rand(20..100)
      )
      Product.create!(
        product_type: 1,
        name: Faker::Music::RockBand.name,
        price: Faker::Commerce.price,
        stock: rand(20..100)
      )
    end
    # binding.break
    puts 'Products created successfuly'
    #######################################
    puts 'Creating carts...'
    Invoice.all.each do |invoice|
      Cart.create!(
        invoice: invoice
      )
    end
    puts 'Carts created successfuly'
    #######################################
    puts 'Creating orders...'
    20.times do
      Order.create!(
        product: Product.all.sample,
        cart_id: Cart.all.sample.id,
        quantity: rand(1..19)
      )
    end
    puts 'Orders created successfuly'
  end
end

#  puts 'Creating orders...'
#     Cart.all.each do |cart|
#       Random.rand(5).times do
#         order = cart.orders.create!(
#           product: Product.all.sample,
#           quantity: rand(1..19)
#         )
#         cart.orders << order
#         cart.save!
#       end
#     end
#     puts 'Orders created successfuly'
# 20.times do
#       Cart.create!(
#         order_id: Order.all.sample.id
#       )
#     end
