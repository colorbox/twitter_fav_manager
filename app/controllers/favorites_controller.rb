class FavoritesController < ApplicationController
  def index
    @tweets = current_user.tweets.page(params[:page]) if current_user
  end
end
