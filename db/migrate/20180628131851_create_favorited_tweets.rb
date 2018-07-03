class CreateFavoritedTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :favorited_tweets do |t|
      t.references :user, null: false
      t.references :tweet, null: false

      t.timestamps
    end
  end
end
