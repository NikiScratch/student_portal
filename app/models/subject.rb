class Subject < ActiveRecord::Base
	belongs_to :schedule
	has_many :assignments
	
	has_many :users, through: :schedule
end
