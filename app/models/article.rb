class Article < ApplicationRecord
	validates :title, presence: true
	validates :body, presence: true
	belongs_to :writer, foreign_key: "author_id", class_name: "Signup"
end 
