class AddStripeProductIdToPrograms < ActiveRecord::Migration[7.1]
  def change
    add_column :programs, :stripe_product_id, :string
  end
end
