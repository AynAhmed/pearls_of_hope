class StripePriceIdToPrograms < ActiveRecord::Migration[7.1]
  def change
    add_column :programs, :stripe_price_id, :string
  end
end
