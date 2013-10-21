class CommentsController < ApplicationController

	def create
		@comment = Comment.new(comment_params)

		respond_to do |format|
	      if @comment.save
	        format.html { redirect_to User.find(params[:user_id]), notice: 'Comment was successfully added.' }
	        format.json { render action: 'show', status: :created, location: @user }
	      else
	        format.html { redirect_to User.find(params[:user_id]), notice: 'Comment not added.' }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	      end
    	end
	end

	def comment_params
      params.require(:comment).permit(:user_id, :author_id, :comment_text)
    end
end