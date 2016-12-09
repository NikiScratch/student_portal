class CreateSchedulesSubjects < ActiveRecord::Migration
  def change
    create_table :schedules_subjects do |t|
    	t.integer :subject_id
    	t.integer :schedule_id
      t.timestamps
    end
  end
end