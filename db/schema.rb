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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121011092815) do

  create_table "deliveries", :force => true do |t|
    t.string   "email_id"
    t.string   "prospect_id"
    t.string   "token"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "deliveries", ["email_id", "prospect_id"], :name => "index_deliveries_on_email_id_and_prospect_id"

  create_table "email_variables", :force => true do |t|
    t.integer  "email_id"
    t.string   "identifier"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "email_variables", ["email_id"], :name => "index_email_variables_on_email_id"

  create_table "emails", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "subject"
    t.text     "body"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "industries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "practitioners"
  end

  create_table "prospects", :force => true do |t|
    t.integer  "industry_id"
    t.string   "company_name"
    t.string   "contact_name"
    t.string   "website"
    t.string   "email"
    t.string   "address"
    t.string   "reference_url"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "prospects", ["industry_id"], :name => "index_prospects_on_industry_id"

end
