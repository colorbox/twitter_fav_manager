class User < ApplicationRecord
  has_many :favorited_tweets
  has_many :tweets, through: :favorited_tweets

  has_many :favorited_owners
  has_many :tweet_owners, through: :favorited_owners
  has_many :timeline_not_fetched_tweet_owners, -> {where('favorited_owners.fetched_status = ?', FavoritedOwner.fetched_statuses[:not_fetched])}, through: :favorited_owners, source: :tweet_owner

  has_many :tags, through: :favorited_tweets
end
