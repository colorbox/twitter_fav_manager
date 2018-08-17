class TagsController < ApplicationController
  def create
    tag = Tag.find_or_create_by!(title: tag_param[:title])
    favorited_tweet = FavoritedTweet.find(params[:favorite_id])

    tag.favorited_tweets << favorited_tweet if tag.favorited_tweets.exclude?(favorited_tweet)

    redirect_back(fallback_location: root_path)
  end

  def destroy
    tag = Tag.find(params[:id])
    tag.destroy

    redirect_back(fallback_location: root_path)
  end

  private

  def tag_param
    params[:tag]
  end
end
