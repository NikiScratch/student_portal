class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @subjects = Subject.all
    respond_with(@subject)
  end

  def show
    respond_with(@subject)
  end

  def new
    @subject = Subject.new
    respond_with(@subject)
  end

  def edit
  end

  def create
    @subject = Subject.new(subject_params)
    @subject.save
    respond_with(@subject)
  end

  def newsubject
    @schedule = Schedule.find(params[:schedule_id])
    @subject = @schedule.subjects.create(subject_params)
    redirect_to schedule_path(@schedule)
  end

  def update
    @subject.update(subject_params)
    respond_with(@subject)
  end

  def destroy
    @subject.destroy
    respond_with(@subject)
  end

  private
    def set_subject
      @subject = Subject.find(params[:id])
    end

    def subject_params
      params.require(:subject).permit(:name, :schedule_id, :teacher_id)
    end
end
