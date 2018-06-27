namespace :favorites do

  desc 'fetch user favorites'
  task fetch: :environment do
    User.all.each do |user|
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key = ENV['CONSUMER_KEY']
        config.consumer_secret = ENV['CONSUMER_SECRET']
        config.access_token = user.access_token
        config.access_token_secret = user.access_token_secret
      end

      max_id = nil
      continue_flag = true
      while continue_flag do
        favorites = if max_id.nil?
                      @client.favorites(count: 200)
                    else
                      @client.favorites(count: 200, max_id: max_id)
                    end

        favorites.each do |f|
          tweet_id = f.id.to_s
          Tweet.find_or_create_by!(tweet_identifier: tweet_id)
          max_id = tweet_id if max_id.nil? || max_id > tweet_id
        end

        continue_flag = false if favorites.count<=1
      end
    end
  end
end
