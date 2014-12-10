class AddTeacherIdToComments < ActiveRecord::Migration
  def up
    
    add_column :comments, :teacher_id, :integer
   end

   def down
    
    remove_column :comments, :teacher_id, :integer
   end
end
