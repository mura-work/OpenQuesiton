class BooksController < ApplicationController
  def new
  	@book = Book.new
  end

  def create
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
  	if @book.save
  		flash[:notice] = "投稿が作成されました"
  		redirect_to books_path
  	else
  		render "new"
  	end
  end

  def index
	  @books = Book.all
  end

  def search
	if params[:person][:person_id].empty? && params[:genre][:genre_id].empty?
		@books = Book.all
		render :index
    elsif params[:person][:person_id].present? && params[:genre][:genre_id].empty?
		@person_id = params[:person][:person_id].to_i
		@books = Book.where(person_id: @person_id)
		render :index, locals: { books: @books}
	elsif params[:person][:person_id].empty? && params[:genre][:genre_id].present?
		@genre_id = params[:genre][:genre_id].to_i
		@books = Book.where(genre_id: @genre_id)
		render :index, locals: { books: @books}
	elsif params[:person][:person_id].present? && params[:genre][:genre_id].present?
		@person_id = params[:person][:person_id].to_i
		@genre_id = params[:genre][:genre_id].to_i
		@books = Book.where(person_id: @person_id, genre_id: @genre_id)
		render :index, locals: { books: @books}
	end
  end


  def show
  	@book = Book.find(params[:id])
  	@book_comment = BookComment.new
  	@comment = BookComment.where(params[:book_id])
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])
  	@book.user_id = current_user.id
  	if @book.update
  		flash[:notice] = "投稿が作成されました"
  		redirect_to book_path(@book)
  	else
  		render "edit"
  	end
  end

  def destroy
  	@book = Book.find(params[:id])
  	@book.destroy
  	redirect_to books_path(@book)
  end

  private
  def book_params
  	params.require(:book).permit(:body, :person_id, :genre_id)
  end
end
