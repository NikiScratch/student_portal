 class CommentsController < ApplicationController
 before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def show
  end


  def new
    @assignment = Assignment.find(params[:assignment_id])
    @comment = @assignment.comments.create(comment_params)
    #Add if Teacher? save to teacher id if student student_id

    @comment.student_id = current_user.id
    
    #redirect_to assignment_path(@assignment)
  end

  def edit
  end

  def create
    @assignment = Assignment.find(params[:assignment_id])
    @comment = @assignment.comments.build(comment_params)
    #if student view student comments if teacher same logic
    @comment.student_id = current_user.id
    @comment.save
    flash[:notice] = "Thanks for your comment!"
    redirect_to assignment_path(@assignment)
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment, notice: 'Comment was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def accept_assignment
    @comment=Comment.find(params[:comments_id])
    accept(@comment)
    redirect_to assignment_comment_path(@comment)
  end

  def decline_assignment
    @comment=Comment.find(params[:id])
    decline(@comment)
  end

  def destroy
    @assignment = Assignment.find(params[:assignment_id])
    @comment = @assignment.comments.find(params[:id])
    @comment.destroy
    redirect_to assignment_path(@assignment)
    #@comment = Comment.find(params[:comments_id])
    #@comment.destroy
    #redirect_to comment_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:description)
    end

    def find_assignment
      @assignment = Assignment.find(params[:assignment_id])
    end
end
