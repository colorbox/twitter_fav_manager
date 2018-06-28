class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :tweet_identifier, null: false
      t.references :tweet_owner

      t.timestamps

      t.index :tweet_identifier, unique: true
    end
  end
end
