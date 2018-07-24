class FavoritesController < ApplicationController
  def index
    @tweets = current_user.tweets.limit(3) if current_user
  end
end
