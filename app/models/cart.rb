class Cart < ApplicationRecord
  has_many :cart_products, dependent: :destroy
  has_many :products, through: :cart_products
  has_many :students, through: :cart_products

  def total
    total_price = 0
    cart_products.each do |cart_product|
      total_price += cart_product.product.price * quantity_for_product(cart_product.product_id)
    end
    total_price
  end

  def quantity_for_product(product_id)
    cart_products.where(product_id: product_id).count
  end

end
