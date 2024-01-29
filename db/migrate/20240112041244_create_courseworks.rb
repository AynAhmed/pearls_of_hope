class CreateCourseworks < ActiveRecord::Migration[7.1]
  def change
    create_table :courseworks do |t|
      t.string :name
      t.string :description
      t.string :content
      t.references :program, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
