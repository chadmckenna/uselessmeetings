# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_07_10_025934) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "meetings", force: :cascade do |t|
    t.string "title"
    t.string "share_slug", null: false
    t.string "review_slug", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["review_slug"], name: "index_meetings_on_review_slug"
    t.index ["share_slug"], name: "index_meetings_on_share_slug"
  end

  create_table "reviews", force: :cascade do |t|
    t.boolean "agenda"
    t.integer "agenda_met"
    t.integer "appropriate_meeting_time"
    t.integer "appropriate_meeting_length"
    t.integer "started_on_time"
    t.integer "ended_on_time"
    t.boolean "action_items"
    t.integer "on_topic"
    t.integer "usefulness"
    t.integer "necessary_to_attend"
    t.integer "ability_to_contribute"
    t.string "improvements"
    t.string "other_comments"
    t.bigint "meeting_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["meeting_id"], name: "index_reviews_on_meeting_id"
  end

  add_foreign_key "reviews", "meetings"
end
