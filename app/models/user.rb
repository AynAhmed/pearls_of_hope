class User < ApplicationRecord
  has_many :students
  has_one :cart
  has_many :enrollments
  has_many :payments
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable



  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

          pay_customer stripe_attributes: :stripe_attributes




        def self.ransackable_attributes(auth_object = nil)
          ["created_at", "email", "first_name", "id", "id_value", "last_name", "password", "role",  "phone_number", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
        end

        
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
        
        def create_cart
          Cart.create(user: self)
        end

        def enrolled_in?(program)
          # Check if the user is enrolled in the specified program
          enrollments.exists?(program_id: program.id)
        end
      end
