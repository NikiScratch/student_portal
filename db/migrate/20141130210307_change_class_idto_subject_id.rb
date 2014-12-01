class ChangeClassIdtoSubjectId < ActiveRecord::Migration
  def up
    rename_column :assignment, :class_id, :subject_id
    
  end
 
  def down
    rename_column :assignment, :subject_id, :class_id
    
  end
end
