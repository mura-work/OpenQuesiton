class Book < ApplicationRecord
	belongs_to :user
	belongs_to :person
	belongs_to :genre
	has_many :book_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :favorited_users, through: :favorites, source: :user
end
