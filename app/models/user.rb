class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :schedules
  has_many :subjects, through: :schedules
  has_many :assignments, through: :subjects
  has_many :comments, through: :assignments
  has_many :student_comments, :foreign_key => "student_id", :class_name => "Comment"
  has_many :teacher_comments, :foreign_key => "teacher_id", :class_name => "Comment"
  has_many :teacher_subjects, :foreign_key => "teacher_id", :class_name => "Subject"
end