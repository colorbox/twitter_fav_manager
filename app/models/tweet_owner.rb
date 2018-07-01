class TweetOwner < ApplicationRecord
  has_many :tweets

  has_many :favorited_users
  has_many :user, through: :favorited_users
end
