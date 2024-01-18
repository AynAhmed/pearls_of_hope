class Image < ApplicationRecord
    has_one_attached :image_data
    mount_uploader :image_data, ImageUploader
    def self.ransackable_attributes(auth_object = nil)
        %w[id title created_at updated_at]
      end
end
