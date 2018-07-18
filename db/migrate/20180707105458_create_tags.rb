class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.references :favorited_tweet, null: false
      t.references :user, null: false

      t.string :name

      t.timestamps
    end

    create_table :favorited_tweets_tags, id: false do |t|
      t.belongs_to :favorited_tweets, index: true
      t.belongs_to :tags, index: true
    end
  end
end
