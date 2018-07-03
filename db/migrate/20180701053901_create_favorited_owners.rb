class CreateFavoritedOwners < ActiveRecord::Migration[5.2]
  def change
    create_table :favorited_owners do |t|
      t.references :users, null: false
      t.references :tweet_owners, null: false
      t.integer :fetch_status, default: 0, null: false, limit: 1

      t.timestamps
    end
  end
end
