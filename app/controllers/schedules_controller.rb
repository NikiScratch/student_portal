class SchedulesController < ApplicationController

  before_action :set_schedule, only: [:show, :edit, :update, :destroy]
  respond_to :html


  def index
    @schedules = Schedule.all
    respond_with(@schedules)
  end

  def show
    respond_with(@schedule)
  end


  def new
    @schedule = Schedule.new
    #@user = User.find(params[:user_id])
    #@schedule = @user.schedules.create(schedule_params)
    respond_with(@schedule)
  end

  def edit
  end


  def create
    @schedule = Schedule.new(schedule_params)
    @subject = @schedule.subjects.create(subject_params)
    @schedule.save
    respond_with(@schedule)
  end


  def update

    params[:schedule][:subject_ids] ||= []

    @schedule = Schedule.find(params[:id])

    if @schedule.update_attricutes(params[:schedule])

      flash[:notice]= 'Added succesfully.'

      redirect_to :action => 'show', :id => @schedule

    #@schedule.update(schedule_params)

    #respond_with(@schedule)

    end
  end

  def destroy
    @schedule.destroy
    respond_with(@schedule)
  end

  def addsubject
    @schedule = Schedule.find(schedule_params)
    @subject = @schedule.subject_id(params[:subject_id])
    @schedule.save
  end




  private
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    def schedule_params
      params.require(:schedule).permit(:subject_id, :id, :user_id)
      #params.require(:schedule).permit(:user_id)
    end

end


