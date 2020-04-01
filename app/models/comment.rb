class Comment < ApplicationRecord
  belongs_to :blog
  has_many :likes
end
