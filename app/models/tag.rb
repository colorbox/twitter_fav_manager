class Tag < ApplicationRecord
  belongs_to :user
  belongs_to :favorited_tweet
end
