class CreatePrograms < ActiveRecord::Migration[7.1]
  def change
    create_table :programs do |t|
      t.string :name
      t.string :description
      t.string :type
      t.string :age_group
      t.string :date
      t.boolean :fee

      t.timestamps
    end
  end
end
