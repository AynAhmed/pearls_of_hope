class CartProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  

    

  def total
    cart_products.to_a.sum { |cart_product| cart_product.price }
  end
end
