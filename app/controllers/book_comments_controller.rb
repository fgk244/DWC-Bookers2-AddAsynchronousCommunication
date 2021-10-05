class BookCommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@book = Book.find(params[:book_id])
		@book_comment = BookComment.new(book_comment_params)
		@book_comment.book_id = @book.id
		@book_comment.user_id = current_user.id
		@book_comment_new = BookComment.new
		if @book_comment.save

		else
		  redirect_back fallback_location: root_path
		end
	end

	def destroy
		@book = Book.find(params[:book_id])
  	    book_comment = @book.book_comments.find(params[:id])
		book_comment.destroy
		@comment = BookComment.new

	end

	private
	def book_comment_params
		params.require(:book_comment).permit(:comment)
	end
end
