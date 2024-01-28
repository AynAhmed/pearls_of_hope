class AddPriceIdToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :price_id, :string
  end
end
