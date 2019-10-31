class BookCommentsController < ApplicationController
	before_action :authenticate_user!
	def create
		@book = Book.find(params[:book_id])
	    comment = current_user.book_comments.new(book_comment_params)
	    comment.book_id = @book.id
		if  comment.save
		    flash[:notice] = "投稿が作成されました"
			redirect_to book_path(book)
		else
			@book = Book.find(params[:book_id])
			@book_comment = BookComment.new
			  @comment = BookComment.where(params[:book_id])
			  flash[:notice] = "コメントが作成できませんでした。"
			render "books/show"
		end
	end

	def destroy
		@book_comment = BookComment.find(params[:id])
		@book_comment.destroy
		redirect_to book_path(@book_comment.book)
	end

	private
	def book_comment_params
		params.require(:book_comment).permit(:comment, :user_id)
	end
end




