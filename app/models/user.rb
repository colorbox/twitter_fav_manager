class User < ApplicationRecord
  has_many :favorited_tweets
  has_many :tweets, through: :favorited_tweets

  has_many :tags
end
