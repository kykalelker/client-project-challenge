class Movie < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :comments, as: :commentable
  has_many :favorites
  has_many :watches
end
