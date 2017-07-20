class Watch < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  def self.watch_movies(user_id)
    list = Watch.where(user_id: user_id)
    list.map do |item|
      item.movie
    end
  end
end
