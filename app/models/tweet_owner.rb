class TweetOwner < ApplicationRecord
  has_many :tweets

  has_many :favorited_owners
  has_many :user, through: :favorited_owners
end
