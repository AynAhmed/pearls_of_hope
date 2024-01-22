# lib/tasks/populate_roles.rake
namespace :db do
    desc "Fill roles table with default roles"
    task fill_roles: :environment do
      begin
        ['default', 'instructor'].each do |role_name|
          role = Role.find_or_create_by(name: role_name)
          if role.persisted?
            puts "Role '#{role_name}' created or already exists."
          else
            puts "Failed to create role '#{role_name}'. Errors: #{role.errors.full_messages.join(", ")}"
          end
        end
      rescue StandardError => e
        puts "An error occurred: #{e.message}"
      end
  
      puts "Roles have been populated!"
    end
  end
  