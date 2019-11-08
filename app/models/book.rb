class Book < ApplicationRecord
	belongs_to :user
	belongs_to :person
	belongs_to :genre
	has_many :book_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :favorited_users, through: :favorites, source: :user
	validates :body, presence:true

	def self.favorite
		 Book.find(Favorite.group(:book_id).order('count(book_id) desc').limit(3).pluck(:book_id))
	end

	def self.person
		Book.find(Book.group(:person_id).order('count(person_id) desc').limit(3).pluck(:person_id))
	end
	   
	def self.genre
		Book.find(Book.group(:genre_id).order('count(genre_id) desc').limit(3).pluck(:genre_id))
   	end

	def self.recent
		Book.order(created_at: "desc").limit(3)
	end

end
