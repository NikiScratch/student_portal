class Subject < ActiveRecord::Base
	has_many :assignments
	belongs_to :schedule
	has_many :users, through: :schedule
end
