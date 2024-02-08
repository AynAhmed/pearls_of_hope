class Student < ApplicationRecord
  belongs_to :user
  has_many :enrollments
   

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :dob, presence: true

  validate :unique_full_name





  def full_name
    "#{first_name} #{last_name}"
  end

  
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "dob", "first_name", "id", "id_value", "last_name", "updated_at", "user_id"]
  end


  private

  def unique_full_name
    existing_student = Student.find_by(first_name: first_name, last_name: last_name)
    
    if existing_student && existing_student != self
      errors.add(:base, "A student with the same first name and last name already exists.")
    end
  end

end
