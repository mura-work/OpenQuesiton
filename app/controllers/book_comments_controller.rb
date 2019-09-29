class BookCommentsController < ApplicationController
	def create
		@book = Book.find(params[book_id])
		@comment = current_user.book_comments.new(book_comments_params)
		@comment.book_id = book.id
		@comment.save
		redirect_to book_path(@book)
	end

	def destroy
		@book_comment = BookComment.find(params[:id])
		@book_comment.destroy
		redirect_to book_path(@book_comment.book)
	end

	private
	def book_comments_params
		params.require(:book_comment).permit(:comment, :user_id)
	end
end





