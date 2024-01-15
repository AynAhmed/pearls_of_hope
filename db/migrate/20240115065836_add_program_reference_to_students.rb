class AddProgramReferenceToStudents < ActiveRecord::Migration[7.1]
  def change
    add_reference :students, :program, null: false, foreign_key: true
  end
end
