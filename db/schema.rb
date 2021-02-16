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

ActiveRecord::Schema.define(version: 2021_02_16_121244) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "forums", force: :cascade do |t|
    t.string "name"
    t.string "sys_name"
    t.string "password_digest"
    t.integer "owner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_forums_on_owner_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.string "second_name"
    t.integer "status"
    t.integer "tariff"
    t.string "email"
    t.string "password_digest"
    t.string "roles", default: [], array: true
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end