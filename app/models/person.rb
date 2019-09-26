class Person < ApplicationRecord
	has_many :books, dependent: :destroy
	validates :person_name, presence:true
end
