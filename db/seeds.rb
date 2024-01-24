# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# db/seeds.rb


# db/seeds.rb
#logo data
logo_image_path = Rails.root.join('public', 'uploads', 'image', 'image_data', '2', 'pearl-logo-768x497.png')

if File.exist?(logo_image_path)
  Image.find_or_create_by!(title: 'logo') do |image|
    # If you're using CarrierWave for image uploads:
    image.image_data = File.open(logo_image_path)

    # For other uploaders, adjust accordingly.
  end
else
  puts "Logo image file not found at #{logo_image_path}"
end
