class GenresController < ApplicationController
	before_action :authenticate_user!
  def index
  	@genres = Genre.all
  end

  def new
  	@genre = Genre.new
  end

  def create
  	@genre = Genre.new(genre_params)
  	if @genre.save
  		flash[:notice] = "投稿が作成されました"
  		redirect_to genres_path
  	else
  		render "index"
  	end
  end

  def edit
  	@genre = Genre.find(params[:id])
  end

  def update
  	@genre = Genre.find(params[:id])
  	if @genre.update(genre_params)
  		flash[:notice] = "投稿が作成されました"
  		redirect_to genres_path
  	else
  		render "edit"
  	end
  end

  def destroy
  	@genre = Genre.find(params[:id])
  	@genre.destroy
  	redirect_to genres_path
  end

  private
  def genre_params
  	params.require(:genre).permit(:genre_name)
  end
end
