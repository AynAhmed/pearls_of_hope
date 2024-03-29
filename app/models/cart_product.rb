class CartProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  validates :cart_id, presence: true
  validates :product_id, presence: true

  def total
    product.price * quantity
  end
end
