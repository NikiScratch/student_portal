class SchedulesController < ApplicationController

  before_action :set_schedule, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @schedules = Schedule.all
    respond_with(@schedules)
  end

  def show
    #current_user.schedules.find(params[:id])
    respond_with(@schedule)
  end

  def new
    @schedule = Schedule.new
    respond_with(@schedule)
  end

  def edit
  end

  def create
    @schedule = Schedule.new(schedule_params)
    #@subject = @schedule.subjects.create(params[:subject_id])
    #@subject = @schedule.subjects.create(subject_params)

    @schedule.save
    respond_with(@schedule)
  end

  def update

    # params[:schedule][:subject_ids] ||= []
    # @schedule = Schedule.find(params[:id])
    # if @schedule.update_attricutes(params[:schedule])
    #   flash[:notice]= 'Added succesfully.'
    #   redirect_to :action => 'show', :id => @schedule
    @schedule.update(schedule_params)
    respond_with(@schedule)
#end
    #params[:schedule][:subject_ids] ||= []
    #@schedule = Schedule.find(params[:id])
    #if @schedule.update_attributes(params[:schedule])
    #  flash[:notice]= 'Added succesfully.'
    #  redirect_to :action => 'show', :id => @schedule
      #end
    #@schedule.update(schedule_params)
    #respond_with(@schedule)
  

  end

  def destroy
    @schedule.destroy
    respond_with(@schedule)
  end

  def addsubject
    @schedule = current_user.schedules.find(params[:schedule_id])
    
    # if @schedule.subjects.find(params[:subject_id])
    #   redirect_to root_path
    # else
    #   @schedule.subjects << Subject.find(params[:subject_id])
    #   redirect_to @schedule
    # end

    if @schedule
         @schedule.subjects << Subject.find(params[:subject_id])
         redirect_to @schedule
    else @schedule.subjects.find(params[:subject_id])
         redirect_to root_path
    end

  end

  private
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    def schedule_params
      #
      params.require(:schedule).permit(:subject_id, :id, :user_id)
      #params.require(:schedule).permit(:subject_id)
    end

end
