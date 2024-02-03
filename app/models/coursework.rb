class Coursework < ApplicationRecord
  belongs_to :program
  has_many_attached :attachments
end
