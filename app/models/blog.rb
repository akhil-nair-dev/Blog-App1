class Blog < ApplicationRecord
	belongs_to :user
	has_many :comments
	has_many :likes
	is_impressionable
	validates :title, presence: true,length: {minimum: 5}
	validates :description, presence: true
	acts_as_votable
	acts_as_followable
end

