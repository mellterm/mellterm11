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

ActiveRecord::Schema.define(:version => 20110126110437) do

  create_table "domains", :force => true do |t|
    t.string   "code"
    t.string   "long_name"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages", :force => true do |t|
    t.string   "code"
    t.string   "long_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "searches", :force => true do |t|
    t.string   "source_content"
    t.string   "target_content"
    t.integer  "source_language_id"
    t.integer  "target_language_id"
    t.integer  "domain_id"
    t.boolean  "is_public"
    t.boolean  "is_query"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "job_id"
  end

  create_table "subscriptions", :force => true do |t|
    t.integer  "subscriber_id"
    t.integer  "subscribee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscriptions", ["subscribee_id"], :name => "index_subscriptions_on_subscribee_id"
  add_index "subscriptions", ["subscriber_id", "subscribee_id"], :name => "index_subscriptions_on_subscriber_id_and_subscribee_id", :unique => true
  add_index "subscriptions", ["subscriber_id"], :name => "index_subscriptions_on_subscriber_id"

  create_table "terms", :force => true do |t|
    t.string   "source_content"
    t.string   "target_content"
    t.integer  "source_language_id"
    t.integer  "target_language_id"
    t.integer  "domain_id"
    t.text     "notes"
    t.integer  "source"
    t.boolean  "is_query"
    t.boolean  "is_public"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "terms", ["domain_id"], :name => "index_terms_on_domain_id"
  add_index "terms", ["source_language_id"], :name => "index_terms_on_source_language_id"
  add_index "terms", ["target_language_id"], :name => "index_terms_on_target_language_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "skype"
    t.string   "time_zone"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "admin",                 :default => false
    t.string   "city_name"
    t.integer  "native_language_id"
    t.integer  "preferred_language_id"
    t.integer  "provider_id"
    t.integer  "credit_balance",        :default => 0
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
