class FavoritedTweet < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  has_many :tags
end
