class CartProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  belongs_to :student
  belongs_to :program
end
