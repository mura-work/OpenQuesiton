class Book < ApplicationRecord
	belongs_to :user
	belongs_to :person
	belongs_to :genre
	has_many :book_comments, dependent: :destroy
end
