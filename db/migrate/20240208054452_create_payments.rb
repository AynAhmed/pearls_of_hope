class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.integer :amount
      t.string :program_ids
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
