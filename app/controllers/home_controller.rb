class HomeController < ApplicationController
  def top
    @home_favorites = Book.favorite
    @person = Book.person
    @genre = Book.genre
    @recent = Book.recent
  end

  def about
  end
end
