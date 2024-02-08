class Program < ApplicationRecord
    has_many :courseworks
    has_many :enrollments
    
    validates :name, presence: true
    validates :description, presence: true
    validates :program_type, presence: true
    validates :age_group, presence: true
    validates :date, presence: true
    validates :fee, inclusion: { in: [true, false] }

    has_many :courseworks
    has_one :product

   def self.ransackable_attributes(auth_object = nil)
        ["age_group", "created_at", "date", "description", "id", "id_value", "name", "fee", "program_type", "updated_at"]
    end

    
end

