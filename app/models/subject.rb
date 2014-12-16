class Subject < ActiveRecord::Base
	belongs_to :schedule
	has_many :assignments
	
	has_many :users, through: :schedule
	belongs_to :teacher, :class_name => "User"
end
