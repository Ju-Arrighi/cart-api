require 'faker'

namespace :dev do
  desc 'Configure development setup'
  task setup: :environment do
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
    puts 'Products created successfuly'
    #######################################
    puts 'Creating carts and orders...'
    20.times do
      cart = Cart.new
      rand(5).times do
        product = Product.all.sample
        price = product.price
        quantity = rand(1..19)
        subtotal = price * quantity
        total = 0
        Order.create!(
          product_id: product.id,
          cart_id: cart.id,
          quantity: quantity,
          subtotal: subtotal
        )
        total += subtotal
        cart[:total] = total
        cart.save
      end
    end
    puts 'Carts and orders created successfuly'
  end
end
