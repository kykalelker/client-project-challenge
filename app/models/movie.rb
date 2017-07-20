class Movie < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :comments, as: :commentable
  has_many :favorites
  has_many :watches

  validates :title, :year, :lead_actor, presence: true

  after_initialize :default_url

  scope :recent, -> { order("created_at DESC").limit(3) }

  def default_url
    self.boxart_url = "http://www.baygallery.com.au/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/placeholder/default/no-image---protrait_6.jpg" if self.boxart_url == ""
  end
end
