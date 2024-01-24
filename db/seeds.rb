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

# Add this at the top of your seeds.rb file if not already present
require 'fileutils'

# Function to create image records
def create_image_record(title, file_path)
  if File.exist?(file_path)
    Image.find_or_create_by!(title: title) do |image|
      image.image_data = File.open(file_path)
    end
  else
    puts "Image file not found for title '#{title}' at #{file_path}"
  end
end

# Logo image seed
logo_image_path = Rails.root.join('public', 'uploads', 'image', 'image_data', '2', 'pearl-logo-768x497.png')
create_image_record('logo', logo_image_path)

# Image seeds for carousel
carousel_images = {
  'diamonds3_carousel1' => 'public/uploads/image/image_data/2/Diamonds3.jpg',
  'frontiers2_carousel2' => 'public/uploads/image/image_data/2/Frontiers2.jpg',
  'house_carousel' => 'public/uploads/image/image_data/2/house.jpg',
  'pearls_carousel' => 'public/uploads/image/image_data/2/Pearls-1536x1152.jpg'
}

carousel_images.each do |title, path|
  image_path = Rails.root.join(path)
  create_image_record(title, image_path)
end



