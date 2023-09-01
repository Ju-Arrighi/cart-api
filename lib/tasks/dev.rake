require 'faker'

namespace :dev do
  desc 'Configure development setup'
  task setup: :environment do
    puts 'Creating Products'
    50.times do
      Product.create!(
        product_type: 0,
        name: Faker::Commerce.product_name,
        price: Faker::Commerce.price
      )
      Product.create!(
        product_type: 1,
        name: Faker::Music::RockBand.name,
        price: Faker::Commerce.price
      )
    end
    puts 'Products created successfuly'
  end
end
