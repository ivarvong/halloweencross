# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20131027235319) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "page_photos", force: true do |t|
    t.integer  "photo_id"
    t.integer  "page_id"
    t.integer  "order"
    t.hstore   "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sort_order"
  end

  add_index "page_photos", ["order"], name: "index_page_photos_on_order", using: :btree
  add_index "page_photos", ["page_id"], name: "index_page_photos_on_page_id", using: :btree
  add_index "page_photos", ["photo_id"], name: "index_page_photos_on_photo_id", using: :btree

  create_table "pages", force: true do |t|
    t.text     "markdown"
    t.string   "slug"
    t.hstore   "past_slugs"
    t.hstore   "metadata"
    t.string   "title"
    t.text     "template"
    t.text     "html"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["slug"], name: "index_pages_on_slug", unique: true, using: :btree

  create_table "photos", force: true do |t|
    t.hstore   "iptc"
    t.hstore   "data"
    t.string   "caption"
    t.string   "byline"
    t.hstore   "sizes"
    t.string   "s3_key"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "bucket"
  end

end
