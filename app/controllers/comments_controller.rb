 class CommentsController < ApplicationController
 before_action :set_pin, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = Comment.new(pin_params)
    if @comment.save
      redirect_to @comment, notice: 'Pin was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment, notice: 'Pin was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @comment.destroy
    redirect_to comment_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.require(:pin).permit(:description)
    end
end