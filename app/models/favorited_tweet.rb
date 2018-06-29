class FavoritedTweet < ApplicationRecord
  belongs_to :tweet_owner
  belongs_to :user
  has_one :tweet
end
