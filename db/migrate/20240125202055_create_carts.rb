class CreateCarts < ActiveRecord::Migration[7.1]
  def change
    create_table :carts do |t|
      t.string :status
      t.integer :total

      t.timestamps
    end
  end
end
