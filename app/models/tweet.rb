class Tweet < ApplicationRecord
  belongs_to :tweet_owner
  has_many :favorited_tweets
  has_many :users, through: :favorited_tweets

  def embed_html
    url = "https://api.twitter.com/1.1/statuses/oembed.json?id=#{tweet_identifier}"
    result = Net::HTTP.get(URI.parse(url))
    json = JSON.parser.new(result)
    hash = json.parse()
    hash['html']
  end
end
