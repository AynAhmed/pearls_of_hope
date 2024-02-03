class CreateEnrollments < ActiveRecord::Migration[7.1]
  def change
    create_table :enrollments do |t|
      t.references :student, foreign_key: true
      t.references :program, foreign_key: true
      t.string :status

      t.timestamps
    end
    # Add an index to optimize querying by student and program
    add_index :enrollments, [:student_id, :program_id], unique: true
  end
end