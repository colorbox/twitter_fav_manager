class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :title, null: false

      t.timestamps
    end

    create_table :favorited_tweets_tags do |t|
      t.belongs_to :favorited_tweet, index: true
      t.belongs_to :tag, index: true

      t.index [:favorited_tweet_id, :tag_id]
    end
  end
end
