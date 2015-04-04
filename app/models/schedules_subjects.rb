class SchedulesSubjects < ActiveRecord::Base
	belongs_to :subject
	belongs_to :schedule
end
