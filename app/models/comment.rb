class Comment < ActiveRecord::Base
	belongs_to :assignment
	has_one :subject
	belongs_to :student, :class_name => "User"
	belongs_to :teacher, :class_name => "User"

	
end
