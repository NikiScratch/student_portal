#require 'role_model'
class User < ActiveRecord::Base
   # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 
  #include RoleModel
 
  # Setup accessible (or protected) attributes for your model
  #attr_accessible :email, :password, :password_confirmation
 
  # optionally set the integer attribute to store the roles in,
  # :roles_mask is the default
  # roles_attribute :roles_mask
 
  # # declare the valid roles -- do not change the order if you add more
  # # roles later, always append them at the end!
  # roles :admin, :teacher, :student

  has_many :schedules
  has_many :subjects, through: :schedules
  has_many :assignments, through: :subjects
  has_many :comments, through: :assignments
  has_many :student_comments, :foreign_key => "student_id", :class_name => "Comment"
  has_many :teacher_comments, :foreign_key => "teacher_id", :class_name => "Comment"
  has_many :teacher_subjects, :foreign_key => "teacher_id", :class_name => "Subject"
end