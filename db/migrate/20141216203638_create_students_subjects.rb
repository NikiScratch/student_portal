class CreateStudentsSubjects < ActiveRecord::Migration
  def change
    create_table :students_subjects do |t|
      t.integer :student_id
      t.integer :subject_id

      t.timestamps
    end
  end
end
