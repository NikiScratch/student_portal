class AddStudentAndTeacherIdToComments < ActiveRecord::Migration
  def up
    rename_column :comments, :user_id, :student_id
    add_column :comments, :teacher_id, :integer
   end

   def down
    rename_column :comments, :student_id, :user_id 
    remove_column :comments, :teacher_id, :integer
   end
end
