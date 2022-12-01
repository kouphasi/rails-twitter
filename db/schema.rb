# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_11_25_093255) do

  create_table "account_tables", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.integer "account_table_id", null: false
    t.integer "tweet_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_table_id"], name: "index_comments_on_account_table_id"
    t.index ["tweet_id"], name: "index_comments_on_tweet_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id", null: false
    t.integer "followed_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "tweets", force: :cascade do |t|
    t.text "contents"
    t.integer "account_table_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_table_id"], name: "index_tweets_on_account_table_id"
  end

  add_foreign_key "comments", "account_tables"
  add_foreign_key "comments", "tweets"
  add_foreign_key "relationships", "account_tables", column: "followed_id"
  add_foreign_key "relationships", "account_tables", column: "follower_id"
  add_foreign_key "tweets", "account_tables"
end
