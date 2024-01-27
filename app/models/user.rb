class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

          pay_customer stripe_attributes: :stripe_attributes



         def self.ransackable_attributes(auth_object = nil)
          ["created_at", "email", "first_name", "id", "id_value", "last_name", "password", "phone_number", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
        end
    
        has_and_belongs_to_many :programs
        def full_name
          "#{first_name} #{last_name}"
        end
      
        def stripe_attributes(pay_customer)
          {
            address: {
              city: pay_customer.owner.city,
              country: pay_customer.owner.country
            },
            metadata: {
              pay_customer_id: pay_customer.id,
              user_id: id # or pay_customer.owner_id
            }
          }
        end
end
