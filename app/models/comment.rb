class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable

  scope :recent, -> { order("created_at DESC").limit(3) }

  def root_movie
    if self.commentable_type == "Movie"
      return self.commentable
    else
      self.commentable.root_movie
    end
  end
end


