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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110612193514) do

  create_table "pages", :force => true do |t|
    t.string  "url"
    t.string  "title"
    t.integer "size"
    t.string  "status_code"
    t.text    "aliase"
    t.integer "links_count"
    t.integer "backlinks_count"
    t.boolean "external"
    t.integer "w3errors"
  end

  create_table "pages_links", :force => true do |t|
    t.integer "from_page_id"
    t.integer "to_page_id"
    t.boolean "no_follow"
    t.string  "title"
    t.string  "inner_text"
  end

  add_index "pages_links", ["from_page_id"], :name => "index_pages_links_on_from_page_id"
  add_index "pages_links", ["no_follow"], :name => "index_pages_links_on_no_follow"
  add_index "pages_links", ["to_page_id"], :name => "index_pages_links_on_to_page_id"

end
