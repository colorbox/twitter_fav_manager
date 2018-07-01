class FavoritedUser < ApplicationRecord
  belongs_to :user
  belongs_to :tweet_owner
end
