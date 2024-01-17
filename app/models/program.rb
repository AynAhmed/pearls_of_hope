class Program < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true
    validates :type, presence: true
    validates :age_group, presence: true
    validates :date, presence: true

   def self.ransackable_attributes(auth_object = nil)
        ["age_group", "created_at", "date", "description", "id", "id_value", "name", "type", "updated_at"]
      end
end
