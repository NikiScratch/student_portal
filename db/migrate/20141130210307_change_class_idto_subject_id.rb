class ChangeClassIdtoSubjectId < ActiveRecord::Migration
  def up
    rename_column :assignments, :class_id, :subject_id
    
  end
 
  def down
    rename_column :assignments, :subject_id, :class_id
    
  end
end
