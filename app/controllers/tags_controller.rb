class TagsController < ApplicationController
  def create
    favorited_tweet = FavoritedTweet.find(params[:favorite_id])
    favorited_tweet.tags.create(title: tag_param[:title])

    redirect_back(fallback_location: root_path)
  end

  private

  def tag_param
    params[:tag]
  end
end
