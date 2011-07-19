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

ActiveRecord::Schema.define(:version => 20110718214114) do

  create_table "camp_registrations", :force => true do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "position"
    t.string   "email"
    t.string   "phone"
    t.string   "school"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "grade"
    t.integer  "yrs_of_exp"
    t.string   "finding_resolute"
    t.integer  "registration_form_id"
  end

  create_table "camps", :force => true do |t|
    t.string   "name"
    t.datetime "start_at"
    t.datetime "end_at"
    t.text     "description"
    t.string   "location"
    t.string   "group"
    t.decimal  "cost",                   :precision => 10, :scale => 0
    t.string   "payment_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.boolean  "show_registration_form",                                :default => true
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                                 :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 25
    t.string   "guid",              :limit => 10
    t.integer  "locale",                          :default => 0
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "fk_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_assetable_type"
  add_index "ckeditor_assets", ["user_id"], :name => "fk_user"

  create_table "club_teams", :force => true do |t|
    t.string   "name"
    t.text     "information"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
    t.integer  "position"
    t.string   "type_inheritance"
    t.boolean  "general_page",     :default => false
  end

  create_table "coach_clinic_registrations", :force => true do |t|
    t.string   "name"
    t.string   "program"
    t.string   "email"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contest_entries", :force => true do |t|
    t.string   "name"
    t.string   "email",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "age"
    t.string   "school"
    t.string   "position"
  end

  create_table "contests", :force => true do |t|
    t.string   "name"
    t.string   "email",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "age"
    t.string   "school"
    t.string   "position"
  end

  create_table "items", :force => true do |t|
    t.string   "type"
    t.string   "title"
    t.text     "body"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.string   "slug"
    t.boolean  "include_tournament_entry_form", :default => false
    t.boolean  "visible",                       :default => true
  end

  create_table "panels", :force => true do |t|
    t.string   "title"
    t.string   "position"
    t.string   "url"
    t.string   "panel_file_name"
    t.string   "panel_content_type"
    t.string   "panel_file_size"
    t.datetime "panel_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["email"], :name => "index_players_on_email", :unique => true
  add_index "players", ["reset_password_token"], :name => "index_players_on_reset_password_token", :unique => true

  create_table "products", :force => true do |t|
    t.string   "name"
    t.float    "price"
    t.string   "size"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registration_forms", :force => true do |t|
    t.boolean  "name",             :default => false
    t.boolean  "age",              :default => false
    t.boolean  "school",           :default => false
    t.boolean  "position",         :default => false
    t.boolean  "email",            :default => false
    t.boolean  "phone",            :default => false
    t.boolean  "address",          :default => false
    t.boolean  "grade",            :default => false
    t.boolean  "yrs_of_exp",       :default => false
    t.boolean  "finding_resolute", :default => false
    t.boolean  "comments",         :default => false
    t.integer  "camp_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resolute_team_sign_ups", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "age"
    t.string   "school"
    t.string   "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "staff_members", :force => true do |t|
    t.string   "name"
    t.text     "bio"
    t.string   "profile_picture_file_name"
    t.string   "profile_picture_content_type"
    t.integer  "profile_picture_file_size"
    t.datetime "profile_picture_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "stats", :force => true do |t|
    t.string   "stat"
    t.integer  "staff_member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tournament_entries", :force => true do |t|
    t.string   "team_name"
    t.string   "coach_name"
    t.string   "coach_phone"
    t.string   "coach_email"
    t.string   "director_name"
    t.string   "division"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tournament_pages", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "slug"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
