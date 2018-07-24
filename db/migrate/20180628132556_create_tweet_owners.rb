class CreateTweetOwners < ActiveRecord::Migration[5.2]
  def change
    create_table :tweet_owners do |t|
      t.string :twitter_identifier, null: false

      t.timestamps
    end
  end
end
