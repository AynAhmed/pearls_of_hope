# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.integer :price
      t.references :program, null: false, foreign_key: true
      t.timestamps
    end
  end
end
