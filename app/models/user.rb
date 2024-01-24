class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         def self.ransackable_attributes(auth_object = nil)
          ["created_at", "email", "first_name", "id", "id_value", "last_name", "password", "phone_number", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
        end
    
        has_and_belongs_to_many :programs
        def full_name
          "#{first_name} #{last_name}"
        end
      
end
