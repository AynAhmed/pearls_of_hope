class Video < ApplicationRecord
    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "id", "id_value", "title", "updated_at", "url"]
      end
end
