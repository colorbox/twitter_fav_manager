class CreateFavoritedTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :favorited_tweets do |t|
      t.integer :user_id, null: false
      t.integer :tweet_id, null:false

      t.timestamps
    end
  end
end