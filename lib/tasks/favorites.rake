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
          owner = TweetOwner.find_or_create_by!(twitter_identifier: owner_id)

          tweet_id = f.id.to_s
          tweet = Tweet.find_or_initialize_by(tweet_identifier: tweet_id)

          owner.tweets << tweet
          user.tweets << tweet
          user.tweet_owners << owner if user.tweet_owners.where(twitter_identifier: owner.twitter_identifier).size.zero?
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

      owners = user.timeline_not_fetched_tweet_owners.includes(:tweets).map{|o|[o.twitter_identifier, o.tweets.size]}.sort_by{|t|t[1]}.reverse.take(20)

      owners.each do |owner_tuple|

        max_id = nil
        continue_flag = true

        while continue_flag do
          debugger
          tweets = if max_id.nil?
                 else
                   @client.user_timeline(owner_tuple[0].to_i, count: 200, max_id: max_id)
                   end

          tweets.each do |f|
            tweet_id = f.id.to_s
            max_id = tweet_id if max_id.nil? || max_id > tweet_id

            if f.favorited?
              owner_id = f.user.id
              owner = TweetOwner.find_or_create_by!(twitter_identifier: owner_id)

              tweet = Tweet.find_or_initialize_by(tweet_identifier: tweet_id)

              owner.tweets << tweet
              user.tweets << tweet
              user.tweet_owners << owner if user.tweet_owners.where(twitter_identifier: owner.twitter_identifier).size.zero?

              pp f.text
              pp"--"
              debugger
            end


            pp f.text

          end
          pp"--"
          pp tweets.last.id
          pp max_id
          pp tweets.count
          pp"--"
          continue_flag = false if tweets.count < 100
        end
      end
    end
  end
end
