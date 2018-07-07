class CreateFavoritedOwners < ActiveRecord::Migration[5.2]
  def change
    create_table :favorited_owners do |t|
      t.references :user, null: false
      t.references :tweet_owner, null: false
      t.integer :fetch_status, default: 0, null: false, limit: 1

      t.timestamps

      t.index [:user_id, :tweet_owner_id]
    end
  end
end
