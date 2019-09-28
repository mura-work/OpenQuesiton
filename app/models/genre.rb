class Genre < ApplicationRecord
	has_many :books, dependent: :destroy
	validates :genre_name, presence:true
end
