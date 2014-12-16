class ChangeTableName < ActiveRecord::Migration
   def up
    rename_table :schedules, :students_subjects
   end

   def down
    rename_table :students_subjects, :schedules
   end
end
