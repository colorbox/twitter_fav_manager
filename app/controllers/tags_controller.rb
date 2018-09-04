class TagsController < ApplicationController
  def create
    tag = current_user.tags.find_or_create_by!(title: tag_param[:title])
    tweet = Tweet.find(params[:tweet_id])

    tag.tweets << tweet if tag.tweets.exclude?(tweet)

    redirect_back(fallback_location: root_path)
  end

  def destroy
    tag = Tag.find(params[:id])
    tweet = Tweet.find(params[:tweet_id])
    tag.tweets.destroy(tweet)

    redirect_back(fallback_location: root_path)
  end

  private

  def tag_param
    params[:tag]
  end
end
