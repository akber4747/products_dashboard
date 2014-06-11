class CommentsController < ApplicationController
  def index
  	@comments = Comment.all
  end

  def create
  	@comment = Comment.create(comment_params)
  	if @comment.save
  		flash[:comment_success] = "you dun added a commnt"
  		redirect_to product_path(@comment.product_id)
  	else
  		flash[:comment_error] = @comment.errors.full_messages
  		redirect_to product_path(@comment.product_id)
  	end
  end

  private
  def comment_params
  	params.require(:comment).permit(:comment, :product_id)
  end
end

