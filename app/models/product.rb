class Product < ApplicationRecord
  belongs_to :program
  has_many :cart_products, dependent: :destroy
  has_many :carts, through: :cart_products

  validates :name, presence: true


  # after_save do
  #     def specific_column_changed?
  #       saved_change_to_stripe_price_id?
  #     end

  #     def update_products_column
  #       products.update()
  #     end
  # end

end
