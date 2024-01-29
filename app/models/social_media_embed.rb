class SocialMediaEmbed < ApplicationRecord
    def self.ransackable_attributes(auth_object = nil)
        ["title", "embed_code", "created_at", "updated_at"]
      end
      validates :instagram_embed_code, presence: true
      attribute :instagram_embed_code, :string
end
