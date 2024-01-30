class Coursework < ApplicationRecord
  belongs_to :program
  belongs_to :user
  has_many_attached :attachments
end
