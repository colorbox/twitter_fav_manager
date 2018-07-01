class CreateFavoritedUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :favorited_users do |t|
      t.references :users
      t.references :tweet_owners

      t.timestamps
    end
  end
end
