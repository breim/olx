class CommentsController < ApplicationController
	def create
		@product = Product.find(params[:comment][:product_id])
		@comment = Comment.new(comment_params)
		@comment.user_id = current_user.id
		@comment.product_id = @product.id
		respond_to do |format|
			if @comment.save
				@comments = @product.comments
				UserMailer.send_comment(@comment).deliver_later
				format.js {}
			else
				format.html { render :new }
				format.json { render json: @comment.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
    respond_to do |format|
      format.js { }
    end
	end

	private
	def comment_params
		params.require(:comment).permit(:user_id, :product_id, :content)
	end
end
