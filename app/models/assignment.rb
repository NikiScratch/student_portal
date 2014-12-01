class Assignment < ActiveRecord::Base
	belongs_to :subject
	has_many :comments
	
end
