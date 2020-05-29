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

ActiveRecord::Schema.define(version: 2020_05_28_193227) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ingredients", force: :cascade do |t|
    t.integer "authorid", null: false
    t.string "name", limit: 35, null: false
    t.decimal "amount", precision: 6, scale: 2, null: false
    t.datetime "createdat", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updatedat", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 35, null: false
    t.string "username", limit: 15, null: false
    t.string "gravatar_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
