class Comment < ActiveRecord::Base
	belongs_to :assignments
	has_one :subject
	has_many :users, through: :subject
end
