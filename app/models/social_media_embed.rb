class SocialMediaEmbed < ApplicationRecord
    def self.ransackable_attributes(auth_object = nil)
        ["title", "embed_code", "created_at", "updated_at"]
      end
end
