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

ActiveRecord::Schema.define(version: 20171207080527) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "caches", id: :serial, force: :cascade do |t|
    t.text "key", null: false
    t.jsonb "data"
    t.jsonb "options"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_caches_on_key", unique: true
  end

  create_table "poems", id: :serial, force: :cascade do |t|
    t.integer "johnson"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.integer "franklin"
    t.text "plain_text"
    t.index ["franklin"], name: "index_poems_on_franklin", where: "(franklin IS NOT NULL)"
    t.index ["johnson"], name: "index_poems_on_johnson", where: "(johnson IS NOT NULL)"
  end

  create_table "rails_admin_histories", id: :serial, force: :cascade do |t|
    t.text "message"
    t.string "username"
    t.integer "item"
    t.string "table"
    t.integer "month", limit: 2
    t.bigint "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item", "table", "month", "year"], name: "index_rails_admin_histories"
  end

  create_table "tweeted_poems", id: :serial, force: :cascade do |t|
    t.integer "poem_id"
    t.integer "count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["poem_id"], name: "index_tweeted_poems_on_poem_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
