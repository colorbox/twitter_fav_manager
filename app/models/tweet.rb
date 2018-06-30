class Tweet < ApplicationRecord
  belongs_to :tweet_owner
  has_many :favorited_tweets
  has_many :users, through: :favorited_tweets
end
