class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable


  validates :body, presence: true

  scope :recent, -> { order("created_at DESC").limit(3) }
  scope :posted_by, ->(user_id) { where(user_id: user_id) }


  def root_movie
    if self.commentable_type == "Movie"
      return self.commentable
    else
      self.commentable.root_movie
    end
  end
end
