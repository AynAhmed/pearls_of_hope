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

# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?



# Add this at the top of your seeds.rb file 
require 'fileutils'

# db/seeds.rb

# Initialize Stripe
stripe_secret_key = ENV['STRIPE_PRIVATE_KEY'] 
Stripe.api_key = stripe_secret_key



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


# since 'programs.jpg' is located in the 'app/assets/images/' directory we grab image like:
home_img_one_path = Rails.root.join('app', 'assets', 'images', 'programs.jpg')
# Create: home page image #1 seed
create_image_record('home-page-image-one', home_img_one_path)

#home image 2 seed

home_img_two_path = Rails.root.join('app', 'assets', 'images', 'group.jpg')
create_image_record('home-page-image-two', home_img_two_path)

#about image 1 seed 

about_img_one_path = Rails.root.join('app', 'assets', 'images', 'family.jpg')
create_image_record('about-page-image-one', about_img_one_path)

#about image 2 seed 

about_img_two_path = Rails.root.join('app', 'assets', 'images', 'mission.png')
create_image_record('about-page-image-two', about_img_two_path)

#about image 3 seed 

about_img_three_path = Rails.root.join('app', 'assets', 'images', 'value.jpg')
create_image_record('about-page-image-three', about_img_three_path)

#about image 4 seed 

about_img_four_path = Rails.root.join('app', 'assets', 'images', 'boys.jpeg')
create_image_record('about-page-image-four', about_img_four_path)



#testimonial img 1

staff_img_one_path = Rails.root.join('app', 'assets', 'images', 'zakya.png')
create_image_record('staff-image-one', staff_img_one_path)

#testimonial img 2

staff_img_two_path = Rails.root.join('app', 'assets', 'images', 'asiya.png')
create_image_record('staff-image-two', staff_img_two_path)



# # Image seeds for program
# program_images = {
#   'al_mustaqbal_academy' => 'al_mustaqbal_academy.jpg',
#   'charms' => 'charms.jpg',
#   'climb' => 'climb.jpg',
#   'diamonds' => 'diamonds.jpg',
#   'explorers' => 'explorers.jpg',
#   'frontiers' => 'frontiers.jpg',
#   'pearls' => 'pearls.jpg',
#   'jewels' => 'jewels.jpg',
#   'placeholder' => 'poh.jpg'
# }

# program_images.each do |title, path|
#   image_path = Rails.root.join(path)
#   image = create_image_record(title, image_path) # Create or find the image record
#   program = Program.find_by(name: title.capitalize) # Assuming title matches program name
#   program.update(image: image) if program # Assign the image to the program if found
# end




#  Create: programs starting data 
Program.find_or_create_by(name: "Al-Mustaqbal Academy") do |program|
  program.description = "The House of Scholars program is our academic program dedicated to nurturing spiritual growth and developing God consciousness. We provide instruction in: Islamic studies, Quran/Noorania, Hadith and Islamic studies. We also offer fun activities and both in-house and off campus field trips. The House Scholars program is open to both boys and girls ages 5-12 and is held on Saturdays from 10:00 am – 2:30 pm."
  program.age_group = "ages 5-12"
  program.program_type = "Academic"
  program.date = "2022-01-01"
  program.fee = true
  program.price = 20
end

Program.find_or_create_by(name: "Jewels") do |program|
  program.description = "The Jewels is our mentoring program for girls In Kindergarten-2nd grade. This program is designed to plant the seeds of love for Islam, our Prophet PBUH and the Sahaba. The classes are set up in a way to keep the youngsters engaged and entertained. Each class starts with circle time covering the theme topics, a short story followed by games and arts crafts activities. The class also goes on excursions that match the theme as well as field trips."
  program.age_group = "2nd grade"
  program.program_type = "Mentoring"
  program.date = "2022-01-01"
  program.fee = true  
  program.price = 20
end

Program.find_or_create_by(name: "Charms") do |program|
  program.description = "Charms is our mentoring program for girls in 3rd-5th grade. The Charms annual theme varies and covers everything from the 99 names of Allah, Heroes and Sheroes in Islam and more. The Charms also have leaders from the community visit our class to inspire our girls. It is during this age group that volunteering and giving back are introduced and exemplified through various challenges and acts of service. The girls are also treated to socials with their Fathers and Father figures at Donuts with Dad and an opportunity to serve their mothers at the annual Tea Time. The girls also attend various field trips throughout the year."
  program.age_group = "3rd-5th grade"
  program.program_type = "Mentoring"
  program.date = "2022-01-01"
  program.fee = true
  program.price = 20
end

Program.find_or_create_by(name: "Explorers") do |program|
  program.description = "The Explorers is our mentoring program for boys in 3rd-5th grade. This program mirrors the Charms program in that it also has an annual theme that varies and covers everything from the 99 names of Allah, Heroes and Sheroes in Islam and more. The Explorers also have leaders from the community visit our class to inspire our boys. The Explorers also collaborate with the Charms in acts of service including our annual Sandwich project and Dental kits drive. The boys are also given opportunities to cater to their mothers during the annual Muffins with Mom. They also participate in our annual March Madness where they have a basketball tournament between fathers and sons one week then attend a Timberwolves game the next."
  program.age_group = "3rd-5th grade"
  program.program_type = "Mentoring"
  program.date = "2022-01-01"
  program.fee = true
  program.price = 20
end

Program.find_or_create_by(name: "Pearls") do |program|
  program.description = "The Pearls was designed for girls going through what is arguably the most challenging part of growing up: 6th-8th grade aka Middle School. Still growing into their own ever-changing body while desperately trying to figure out just who they are; it’s both a scary and confusing time. We’ve designed this program to be a weekly refuge from it all. Every week, we start off with a weekly recap where we encourage the girls to share things that happened to them during the week, both happy and sad. The other girls then congratulate, condole, or advise based on their own experiences. Next we have an interactive halaqa involving our annual theme. After a quick social snack break we wrap up with a fun engaging activity. This is also the year girls get to participate in the anticipated Pearls Ball. The Pearls ball is our alternative to the prom. An elegant evening for the girls to dress up and enjoy an evening of food, fun and festivities!"
  program.age_group = "6th-8th grade"
  program.program_type = "Mentoring"
  program.date = "2022-01-01"
  program.fee = true
  program.price = 20
end



Program.find_or_create_by(name: "Frontiers") do |program|
  program.description = "The Frontiers program is our  mentoring program that serves boys in 6th-10th grades.  Program elements include bi-weekly halaqas followed by physical activity like football or basketball.  Team sports is an important program component that deepens the connection between boys and instills discipline. The boys also attend  workshops and Islamic conventions together. The mentors model integrity, accountability, compassion and respect.  They help our boys by  empowering them to speak their truth and encourage them to take responsibility for their choices."
  program.age_group = "6th-10th grade"
  program.program_type = "Mentoring"
  program.date = "2022-01-01"
  program.fee = true
  program.price = 20
end

Program.find_or_create_by(name: "Diamonds") do |program|
  program.description = "The Diamond’s program is the oldest program at the Pearls of Hope center and caters to young ladies 9th grade to Freshman in college. Classes and workshops have been running since 2009. The classes are designed to help our young ladies become strong, confident members of our community. The classes offer open discussions that allow the young ladies to speak about challenges they face in high school and beyond and receive affirmations and feedback from their mentors and peers. The Diamonds also have presentations that they’ve planned as a part curriculum that help sharpen organization, teamwork and public speaking skills. The Diamonds also help plan and organize events to prepare them for the role of mentor after graduation."
  program.age_group = "9th grade-freshman college"
  program.program_type = "Mentoring"
  program.date = "2022-01-01"
  program.fee = true
  program.price = 20
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

# using find_or_create_by in order avoid duplication
TextContent.find_or_create_by(title: "Address") do |content|
  content.body = "6565 Oakley Drive, Fridley, Minnesota 55432"
end

TextContent.find_or_create_by(title: "Phone") do |content|
  content.body = "952-688-7554"
end

TextContent.find_or_create_by(title: "Email") do |content|
  content.body = "pearlsofhopecenter@gmail.com"
end

#seeding testimonial data-1 

TextContent.find_or_create_by(title: "testimonial#1") do |content|
  content.body = "I love that Pearls of Hope provides safe space for young girls and boys to grow and learn about their Islamic identity and develop sisterhood/brotherhood through their interactions with their peers!  Peers have huge influence on their relationships, having a positive influence over their peers in the program or out in the community can be life changing! - Pearls of Hope Summer Camp Parent"
end

#seeding testimonial data-2

TextContent.find_or_create_by(title: "testimonial#2") do |content|
  content.body = "It's heartening to reflect on my time with Pearls of Hope, joining as a teen around 16-17 and now, at 30, witnessing its enduring role as a safe haven for me and my peers. It's truly a blessing to see it remain a safe space for youth to gather, worship, learn, and share over the years. - Pearls of Hope Diamond 2009 "
end

#seeding testimonial data-3


TextContent.find_or_create_by(title: "testimonial#3") do |content|
  content.body = "Pearls has taught my son so many essential things about Islam especially how to pray. When doing weekly homework he enjoys trying to learn new letters and Quran. Saleh said, “I wish we can have Dugsi (Saturday school) everyday, we do so many fun things while learning! - Al-Mustaqbal Academy parent"
end


#seeding testimonial data-4

TextContent.find_or_create_by(title: "testimonial#4") do |content|
  content.body = "I highly recommend Pearls of Hope to parents looking for a positive environment for their children to learn their Deen and build a confident Islamic identity. Here they will get mentorship, guidance and knowledge of their faith. - Former Diamond Instructor"
end

#about us paragraph

TextContent.find_or_create_by(title: "about-us") do |content|
  content.body = "Pearls of Hope was established in late 2009 by our Founder, sister Danyal Masoud. Danyal grew up in Chicago where , like many young Muslims, she faced many challenges and struggles. She started Pearls of Hope to provide a safe space for youth facing a lot of the same struggles she did growing up. She wanted to be the mentor she would have wanted and needed at their age. So Pearls of Hope was born in the basement of a masjid here in the Twin cities with one class of fifteen girls. The girls who joined the program were given the space to navigate feelings of insecurity and isolation that they often feel in our society. In sister Danyal, the girls found a loving mentor who would listen, counsel and support them unconditionally. They participated in circles of halaqa where they were given the tools to build a solid muslim identity in a an inspiring, engaging and fun environment. On March 30, 2015, Pearls of Hope Community Center was Incorporated. Through its impact, Pearls of Hope grew to offer guidance and support to over 200 youth across 7 programs."
end

#our mission paragraph

TextContent.find_or_create_by(title: "our-mission") do |content|
  content.body = "Our mission is to mentor the leaders of tomorrow using religious education as our foundation and inspiring the use of knowledge into action"
end

#our vision paragraph

TextContent.find_or_create_by(title: "our-vision") do |content|
  content.body = "That youth who come through our program leave a more knowledgeable Muslim and a more confident, compassionate, contributing citizen of our community."
end

#exectuve director

TextContent.find_or_create_by(title: "executive-director-about") do |content|
  content.body = "Zakya A. Gazey is the Executive Director at Pearls of Hope Community Center in Minnesota, bringing over 10 years of expertise in early childhood education and nutrition. With a background in Early Childhood and experience in education, she leads educational initiatives and programs. Zakya's journey with Pearls of Hope started in 2009, and in 2022, she assumed the role of Executive Director, emphasizing her dedication to the organization's mission. Beyond her role, she actively engages in community projects, aiming to empower youth through knowledge and education."
end

#program coordinator

TextContent.find_or_create_by(title: "program-coordinator-about") do |content|
  content.body = "In her role, Asiya is responsible for overseeing community programming, managing students, and fostering effective communication with parents and community members. Her dedication extends to teaching the Diamonds program, where she imparts valuable knowledge and skills to our youth. Beyond her professional achievements, Asiya has a keen interest in design, environmentalism, and health and wellness. This combination of skills and passions allows her to contribute meaningfully to the organization's mission and create a positive impact in the community."
end


# SocialMediaEmbed data - Create: social media embeded posts - post data

SocialMediaEmbed.find_or_create_by(title: "SocMedia#1") do |embed|
  embed.embed_code = '<iframe width="560" height="315" src="https://www.youtube.com/embed/jZbkM2L3rHA?si=USJvzb2i7uCY9_fj" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>'
end

SocialMediaEmbed.find_or_create_by(title: "SocMedia#2") do |embed|
  embed.embed_code = '<blockquote class="instagram-media" data-instgrm-permalink="https://www.instagram.com/p/Czt8xNbR6J1/?utm_source=ig_embed&amp;utm_campaign=loading" data-instgrm-version="14">...</blockquote><script async src="//www.instagram.com/embed.js"></script>'
end

SocialMediaEmbed.find_or_create_by(title: "SocMedia#3") do |embed|
  embed.embed_code = '<iframe src="https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2FPearlsofHopeMN%2Fposts%2Fpfbid02VFYsyWweWyt4wUN9dif1YVinbvT3V6a83fx2Bfm8UZE3ANFrX7XtX9h4HyXahRZsl&show_text=false&width=500" width="500" height="498" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowfullscreen="true" allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe>'
end
