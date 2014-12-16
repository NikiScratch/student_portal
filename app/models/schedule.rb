class Schedule < ActiveRecord::Base
	belongs_to :user
	has_many :subjects
end

  def addsubject 
    @schedule = Schedule.find(:schedule_id)
    @subject = @schedule.subjects.build(params[:subject_id])
    @schedule.save
  end