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
          owner_id = f.user.id
          tweet_id = f.id.to_s

          tweet = Tweet.find_or_create_by(tweet_identifier: tweet_id, tweet_owner_identifier: owner_id)
          user.tweets << tweet if user.tweets.exclude?(tweet)

          max_id = tweet_id if max_id.nil? || max_id > tweet_id

          pp f.text
          pp"--"
        end

        continue_flag = false if favorites.count < 100
      end
    end
  end

  desc 'fetch favorites from user'
  task fetch_from_user: :environment do
    User.all.each do |user|
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key = ENV['CONSUMER_KEY']
        config.consumer_secret = ENV['CONSUMER_SECRET']
        config.access_token = user.access_token
        config.access_token_secret = user.access_token_secret
      end

      twitter_user_identifiers = user.tweets.map(&:tweet_owner_identifier)

      twitter_user_identifiers.each do |identifier|

        max_id = nil
        continue_flag = true

        result_count = 0

        while continue_flag do
          last_max_id = max_id
          tweets = if max_id.nil?
                   @client.user_timeline(identifier.to_i, count: 200, exclude_replies: false, include_rts: true)
                 else
                   @client.user_timeline(identifier.to_i, count: 200, max_id: max_id, exclude_replies: false, include_rts: true)
                 end

          tweets.each do |f|
            tweet_id = f.id.to_s
            max_id = tweet_id if max_id.nil? || max_id > tweet_id

            if f.favorited?
              tweet = Tweet.find_or_initialize_by(tweet_identifier: tweet_id, tweet_owner_identifier: f.user.id)

              user.tweets << tweet if user.tweets.exclude?(tweet)
            end
            pp f.text
          end

          if tweets.count < 100 || (last_max_id.present? && last_max_id == max_id)
            pp"--"
            pp tweets.last.id
            pp max_id
            pp "累積:#{result_count}"
            pp tweets.first.user.name
            pp tweets.first.user.screen_name

            pp"--"

            continue_flag = false
          end
          result_count = result_count + tweets.count
        end
      end
    end
  end
end
