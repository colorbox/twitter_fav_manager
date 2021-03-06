class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :title, null: false
      t.references :user, null: false

      t.timestamps
    end

    create_table :tags_tweets do |t|
      t.belongs_to :tweet, index: true
      t.belongs_to :tag, index: true

      t.index [:tweet_id, :tag_id], unique: true
    end
  end
end
