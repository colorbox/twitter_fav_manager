class FavoritesController < ApplicationController
  def index
    @favorited_tweets = current_user.favorited_tweets.includes(:tweet).page(params[:page]) if current_user
  end
end
