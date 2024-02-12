class Coursework < ApplicationRecord
  belongs_to :program
  has_many_attached :attachments
 

  def self.ransackable_associations(auth_object = nil)
    ["program"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "id_value", "name", "program_id", "updated_at", "user_id"]
  end
end
