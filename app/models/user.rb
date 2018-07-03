class User < ApplicationRecord
  has_many :favorited_tweets
  has_many :tweets, through: :favorited_tweets

  has_many :favorited_owners
  has_many :tweet_owners, through: :favorited_owners
end
