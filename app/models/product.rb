class Product < ApplicationRecord
  belongs_to :program 
  validates :product_name, presence: true
end
