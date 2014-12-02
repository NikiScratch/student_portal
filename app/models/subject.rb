class Subject < ActiveRecord::Base
	has_many :schedule
	has_many :assignments
	
	has_many :users, through: :schedule
end
