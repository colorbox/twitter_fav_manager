# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_07_07_105458) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorited_owners", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "tweet_owner_id", null: false
    t.integer "fetched_status", limit: 2, default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tweet_owner_id"], name: "index_favorited_owners_on_tweet_owner_id"
    t.index ["user_id", "tweet_owner_id"], name: "index_favorited_owners_on_user_id_and_tweet_owner_id"
    t.index ["user_id"], name: "index_favorited_owners_on_user_id"
  end

  create_table "favorited_tweets", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "tweet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tweet_id"], name: "index_favorited_tweets_on_tweet_id"
    t.index ["user_id", "tweet_id"], name: "index_favorited_tweets_on_user_id_and_tweet_id"
    t.index ["user_id"], name: "index_favorited_tweets_on_user_id"
  end

  create_table "favorited_tweets_tags", id: false, force: :cascade do |t|
    t.bigint "favorited_tweets_id"
    t.bigint "tags_id"
    t.index ["favorited_tweets_id"], name: "index_favorited_tweets_tags_on_favorited_tweets_id"
    t.index ["tags_id"], name: "index_favorited_tweets_tags_on_tags_id"
  end

  create_table "tags", force: :cascade do |t|
    t.bigint "favorited_tweet_id", null: false
    t.bigint "user_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["favorited_tweet_id"], name: "index_tags_on_favorited_tweet_id"
    t.index ["user_id"], name: "index_tags_on_user_id"
  end

  create_table "tweet_owners", force: :cascade do |t|
    t.string "twitter_identifier", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tweets", force: :cascade do |t|
    t.string "tweet_identifier", null: false
    t.bigint "tweet_owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tweet_identifier"], name: "index_tweets_on_tweet_identifier", unique: true
    t.index ["tweet_owner_id"], name: "index_tweets_on_tweet_owner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "twitter_identifier", null: false
    t.string "screen_name", null: false
    t.string "name", null: false
    t.string "access_token", null: false
    t.string "access_token_secret", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
