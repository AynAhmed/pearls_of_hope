class CreatePrograms < ActiveRecord::Migration[7.1]
  def change
    create_table :programs do |t|
      t.string :name
      t.string :description
      t.string :type
      t.string :age_group
      t.date :date 
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
