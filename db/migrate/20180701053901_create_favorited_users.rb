class CreateFavoritedUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :favorited_users do |t|
      t.references :users
      t.references :tweet_owners
      t.integer :fetch_status, default: 0, null: false, limit: 1

      t.timestamps
    end
  end
end
