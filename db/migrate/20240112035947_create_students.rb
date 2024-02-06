class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob

      t.references :user, null: false, foreign_key: { on_delete: :cascade } # Add on_delete option


      t.timestamps
    end
  end
end
