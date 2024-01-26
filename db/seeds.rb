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

# Create: Logo image seed
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



#  Create: programs starting data 
Program.find_or_create_by(name: "Al-Mustaqbal Academy") do |program|
  program.description = "The House of Scholars program is our academic program dedicated to nurturing spiritual growth and developing God consciousness. We provide instruction in: Islamic studies, Quran/Noorania, Hadith and Islamic studies. We also offer fun activities and both in-house and off campus field trips. The House Scholars program is open to both boys and girls ages 5-12 and is held on Saturdays from 10:00 am – 2:30 pm."
  program.age_group = "ages 5-12"
  program.program_type = "Academic"
  program.date = "2022-01-01"
  program.fee = true
end

Program.find_or_create_by(name: "Jewels") do |program|
  program.description = "The Jewels is our mentoring program for girls In Kindergarten-2nd grade. This program is designed to plant the seeds of love for Islam, our Prophet PBUH and the Sahaba. The classes are set up in a way to keep the youngsters engaged and entertained. Each class starts with circle time covering the theme topics, a short story followed by games and arts crafts activities. The class also goes on excursions that match the theme as well as field trips."
  program.age_group = "2nd grade"
  program.program_type = "Mentoring"
  program.date = "2022-01-01"
  program.fee = true
end

Program.find_or_create_by(name: "Charms") do |program|
  program.description = "Charms is our mentoring program for girls in 3rd-5th grade. The Charms annual theme varies and covers everything from the 99 names of Allah, Heroes and Sheroes in Islam and more. The Charms also have leaders from the community visit our class to inspire our girls. It is during this age group that volunteering and giving back are introduced and exemplified through various challenges and acts of service. The girls are also treated to socials with their Fathers and Father figures at Donuts with Dad and an opportunity to serve their mothers at the annual Tea Time. The girls also attend various field trips throughout the year."
  program.age_group = "3rd-5th grade"
  program.program_type = "Mentoring"
  program.date = "2022-01-01"
  program.fee = true
end


Program.find_or_create_by(name: "Explorers") do |program|
  program.description = "The Explorers is our mentoring program for boys in 3rd-5th grade. This program mirrors the Charms program in that it also has an annual theme that varies and covers everything from the 99 names of Allah, Heroes and Sheroes in Islam and more. The Explorers also have leaders from the community visit our class to inspire our boys. The Explorers also collaborate with the Charms in acts of service including our annual Sandwich project and Dental kits drive. The boys are also given opportunities to cater to their mothers during the annual Muffins with Mom. They also participate in our annual March Madness where they have a basketball tournament between fathers and sons one week then attend a Timberwolves game the next."
  program.age_group = "3rd-5th grade"
  program.program_type = "Mentoring"
  program.date = "2022-01-01"
  program.fee = true
end

Program.find_or_create_by(name: "Pearls") do |program|
  program.description = "The Pearls was designed for girls going through what is arguably the most challenging part of growing up: 6th-8th grade aka Middle School. Still growing into their own ever-changing body while desperately trying to figure out just who they are; it’s both a scary and confusing time. We’ve designed this program to be a weekly refuge from it all. Every week, we start off with a weekly recap where we encourage the girls to share things that happened to them during the week, both happy and sad. The other girls then congratulate, condole, or advise based on their own experiences. Next we have an interactive halaqa involving our annual theme. After a quick social snack break we wrap up with a fun engaging activity. This is also the year girls get to participate in the anticipated Pearls Ball. The Pearls ball is our alternative to the prom. An elegant evening for the girls to dress up and enjoy an evening of food, fun and festivities!"
  program.age_group = "6th-8th grade"
  program.program_type = "Mentoring"
  program.date = "2022-01-01"
  program.fee = true
end



Program.find_or_create_by(name: "Frontiers") do |program|
  program.description = "The Frontiers program is our  mentoring program that serves boys in 6th-10th grades.  Program elements include bi-weekly halaqas followed by physical activity like football or basketball.  Team sports is an important program component that deepens the connection between boys and instills discipline. The boys also attend  workshops and Islamic conventions together. The mentors model integrity, accountability, compassion and respect.  They help our boys by  empowering them to speak their truth and encourage them to take responsibility for their choices."
  program.age_group = "6th-10th grade"
  program.program_type = "Mentoring"
  program.date = "2022-01-01"
  program.fee = true
end

Program.find_or_create_by(name: "Diamonds") do |program|
  program.description = "The Diamond’s program is the oldest program at the Pearls of Hope center and caters to young ladies 9th grade to Freshman in college. Classes and workshops have been running since 2009. The classes are designed to help our young ladies become strong, confident members of our community. The classes offer open discussions that allow the young ladies to speak about challenges they face in high school and beyond and receive affirmations and feedback from their mentors and peers. The Diamonds also have presentations that they’ve planned as a part curriculum that help sharpen organization, teamwork and public speaking skills. The Diamonds also help plan and organize events to prepare them for the role of mentor after graduation."
  program.age_group = "9th grade-freshman college"
  program.program_type = "Mentoring"
  program.date = "2022-01-01"
  program.fee = true
end

# TextContent data - Create: HOME PAGE -ABOUT US - PARAGRAPH
about_us_para_data = [
  {
    title: "About Us Paragraph",
    body: "Pearls of Hope Community Center is a year round youth center dedicated to helping young girls and boys become responsible and contributing members of society by providing religious education, improving academic skills, offering opportunities to learn practical life skills, and encouraging our youth to look beyond themselves to make a difference in their communities."
  }
  # Add more entries here if needed
]

about_us_para_data.each do |content|
  TextContent.find_or_create_by(title: content[:title]) do |text_content|
    text_content.body = content[:body]
  end
end

# TextContent data - Create: Footer - Business Contact info data

# Seed data with find_or_create_by to avoid duplication
TextContent.find_or_create_by(title: "Address") do |content|
  content.body = "6565 Oakley Drive, Fridley, Minnesota 55432"
end

TextContent.find_or_create_by(title: "Phone") do |content|
  content.body = "952-688-7554"
end

TextContent.find_or_create_by(title: "Email") do |content|
  content.body = "pearlsofhopecenter@gmail.com"
end


