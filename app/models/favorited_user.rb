class FavoritedUser < ApplicationRecord
  belongs_to :user
  belongs_to :tweet_owner

  enum fetched_status: {not_fetched: 0, fetched: 1}
end
