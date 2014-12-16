class AddStudentAndTeacherIdToComments < ActiveRecord::Migration
  def up
    rename_column :comments, :user_id, :student_id

   end

   def down
    rename_column :comments, :student_id, :user_id 
   
   end
end
