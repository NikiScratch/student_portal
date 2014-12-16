class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def accept (comment)
  	comment.approved="1"
    comment.save
  end

  def decline (comment)
  	comment.approved="0"
    comment.save
  end
end
