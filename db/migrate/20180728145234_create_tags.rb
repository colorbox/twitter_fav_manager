class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.references :user, null: false
      t.references :favorited_tweet, null: false

      t.timestamps

      t.index [:user_id, :favorited_tweet_id]
    end
  end
end
