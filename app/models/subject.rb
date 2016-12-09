class Subject < ActiveRecord::Base
	has_and_belongs_to_many :schedules
	has_many :assignments
	
	has_many :users, through: :schedule
	belongs_to :teacher, :class_name => "User"
end
