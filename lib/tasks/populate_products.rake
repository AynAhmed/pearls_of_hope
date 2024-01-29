namespace :db do
    desc "Populating product information into products table"
    task populate_products: :environment do
      product_names = [
        "AL-MUSTAQBAL ACADEMY",
        "Jewels",
        "Charms",
        "Explorers",
        "Pearls",
        "Frontier",
        "Diamonds"
      ]
      price_ids = [
        "price_1OdLxGGFI1uaMnOfvgWU6leH",
        "price_1OdLxiGFI1uaMnOfPdUpfhVg",
        "price_1OdLyTGFI1uaMnOfEo0d2T7m",
        "price_1OdLzKGFI1uaMnOf2ZBtGZfb",
        "price_1OdM07GFI1uaMnOfyKRRoEvY",
        "price_1OdM0aGFI1uaMnOfqJOLd6wL",
        "price_1OdM11GFI1uaMnOfzqqZBWUW"
      ]
      program_ids = [1, 2, 3, 4, 5, 6, 7]
      
      7.times do |i|
        Product.create!(
          product_name: product_names[i],
          price_id: price_ids[i],
          program_id: program_ids[i]
        )
      end
      puts "Products table populated successfully!"
    end
  end
  
  
  
  
  
  
  
  