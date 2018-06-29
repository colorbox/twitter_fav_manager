class User < ApplicationRecord
  has_many :tweets, through: :favorited_tweets
end
