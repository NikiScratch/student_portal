class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @assignments = Assignment.all
    respond_with(@assignments)
  end

  def show
    respond_with(@assignment)
  end

  def new
    #@assignment = Assignment.new
    #respond_with(@assignment)


    @subject = Subject.find(params[:subject_id])
    @assignment = @subject.assignments.create(assignment_params)

    #@comment.user_id = current_user.id
  end

  def edit
  end

  def create
    #@assignment = Assignment.new(assignment_params)
    #@assignment.save
    #respond_with(@assignment)

    @subject = Subject.find(params[:subject_id])
    @assignment = @subject.assignments.create(assignment_params)
    #@assignment.user_id = current_user.id
    redirect_to assignment_path(@assignment)


  end

  def update
    @assignment.update(assignment_params)
    respond_with(@assignment)
  end

  def destroy
    @assignment.destroy
    respond_with(@assignment)
  end

  def accept_assignment
    @comment=Comment.find(params[:comments_id])
    accept(@comment)
    redirect_to assignment_comment_path(@assignment)
  end
  
  def decline_assignment
    @comment=Comment.find(params[:id])
    decline(@comment)
    redirect_to assignment_comment_path(@comment)
  end

  private
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    def assignment_params
      params.require(:assignment).permit(:description, :class_id)
    end
end
