class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :schedules
  has_many :subjects, through: :schedule
  has_many :assignments, through: :classes
  has_many :comments, through: :assignments
end