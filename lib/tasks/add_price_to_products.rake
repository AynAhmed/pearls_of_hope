namespace :db do
    desc "adding price column to the products table"
    task add_price_to_products: :environment do
        Product.update_all(
            price: 20
        )
        puts "price in products table populated successfully!!"
    end
end