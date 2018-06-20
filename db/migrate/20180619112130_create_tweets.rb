class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :tweet_identifier, null: false

      t.timestamps
    end
  end
end
