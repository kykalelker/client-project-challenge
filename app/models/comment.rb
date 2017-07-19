class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable

  def root_movie
    if self.commentable_type == "Movie"
      return self.commentable
    else
      self.commentable.root_movie
    end
  end
end
