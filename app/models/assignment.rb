class Assignment < ActiveRecord::Base
	belongs_to :subject
	has_many :comments, dependent: :destroy
	has_many :users, through: :subject
	
def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end


	
end
