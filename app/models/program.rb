class Program < ApplicationRecord
    def self.ransackable_attributes(auth_object = nil)
        ["age_group", "created_at", "date", "description", "id", "id_value", "name", "type", "updated_at"]
      end
end
