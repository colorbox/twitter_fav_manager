class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :tweet_identifier, null: false
      t.string :tweet_owner_identifier, null: false

      t.timestamps

      t.index [:tweet_identifier, :tweet_owner_identifier], unique: true
    end
  end
end
