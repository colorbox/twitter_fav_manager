class Tweet < ApplicationRecord
  has_many :favorited_tweets
  has_many :users, through: :favorited_tweets

  has_and_belongs_to_many :tags

  def embed_html
    url = "https://api.twitter.com/1.1/statuses/oembed.json?id=#{tweet_identifier}"
    result = Net::HTTP.get(URI.parse(url))
    json = JSON.parser.new(result)
    hash = json.parse()
    hash['html']
  end
end
