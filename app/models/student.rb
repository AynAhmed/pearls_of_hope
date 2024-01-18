class Student < ApplicationRecord
  belongs_to :user
  
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "dob", "first_name", "id", "id_value", "last_name", "updated_at", "user_id"]
  end
end
