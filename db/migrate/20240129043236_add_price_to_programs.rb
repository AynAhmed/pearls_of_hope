class AddPriceToPrograms < ActiveRecord::Migration[7.1]
  def change
    add_column :programs, :price, :integer
  end
end
