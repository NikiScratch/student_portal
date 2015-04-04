class Schedule < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :subjects


  def addsubject 
    @schedule = Schedule.find(:schedule_id)
    @schedule.subjects.build(params[:subject_id])
    @schedule.save
  end

end