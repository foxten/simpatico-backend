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

ActiveRecord::Schema.define(version: 2020_09_25_162020) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alerts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "message"
    t.integer "alertable_id"
    t.string "alertable_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_alerts_on_user_id"
  end

  create_table "friend_requests", force: :cascade do |t|
    t.integer "requestor_id"
    t.integer "requestee_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.bigint "friend_a_id"
    t.bigint "friend_b_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["friend_a_id"], name: "index_friendships_on_friend_a_id"
    t.index ["friend_b_id"], name: "index_friendships_on_friend_b_id"
  end

  create_table "goals", force: :cascade do |t|
    t.string "title"
    t.date "deadline"
    t.boolean "publicly_viewable"
    t.boolean "multi_user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "markers", force: :cascade do |t|
    t.string "title"
    t.text "notes"
    t.boolean "accomplished"
    t.bigint "user_group_goal_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_group_goal_id"], name: "index_markers_on_user_group_goal_id"
  end

  create_table "user_group_goals", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "goal_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["goal_id"], name: "index_user_group_goals_on_goal_id"
    t.index ["user_id"], name: "index_user_group_goals_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "first_name"
    t.string "last_initial"
    t.string "email_address"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "alerts", "users"
  add_foreign_key "markers", "user_group_goals"
  add_foreign_key "user_group_goals", "goals"
  add_foreign_key "user_group_goals", "users"
end
