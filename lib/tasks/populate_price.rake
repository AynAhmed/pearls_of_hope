namespace :db do
    desc "populating prices accross the programs table"
    task populate_price: :environment do
        Program.update_all(price: 2000)
    end

    puts "ALL PROGRAM PRICES SET TO 2000"
end