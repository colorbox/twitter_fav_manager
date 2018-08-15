class TweetsController < ApplicationController
  def index
    @tag = Tag.find(params[:tag_id])
  end
end
