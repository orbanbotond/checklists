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

ActiveRecord::Schema.define(version: 20150225161448) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "checklists", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "account_id"
    t.integer  "recipe_id"
  end

  add_index "checklists", ["account_id"], name: "index_checklists_on_account_id", using: :btree
  add_index "checklists", ["recipe_id"], name: "index_checklists_on_recipe_id", using: :btree

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "account_id"
  end

  add_index "recipes", ["account_id"], name: "index_recipes_on_account_id", using: :btree

  create_table "subscribem_accounts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
    t.string   "subdomain"
  end

  add_index "subscribem_accounts", ["subdomain"], name: "index_subscribem_accounts_on_subdomain", using: :btree

  create_table "subscribem_members", force: :cascade do |t|
    t.integer  "account_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscribem_users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "confirmed_at"
    t.string   "confirmation_token"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "subscribem_users", ["email"], name: "index_subscribem_users_on_email", unique: true, using: :btree
  add_index "subscribem_users", ["reset_password_token"], name: "index_subscribem_users_on_reset_password_token", unique: true, using: :btree

  create_table "tasks", force: :cascade do |t|
    t.string   "description"
    t.boolean  "value"
    t.integer  "checklist_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "checkable_id"
    t.string   "checkable_type"
  end

  add_index "tasks", ["checkable_type", "checkable_id"], name: "index_tasks_on_checkable_type_and_checkable_id", using: :btree
  add_index "tasks", ["checklist_id"], name: "index_tasks_on_checklist_id", using: :btree

  add_foreign_key "checklists", "recipes"
  add_foreign_key "checklists", "subscribem_accounts", column: "account_id"
  add_foreign_key "recipes", "subscribem_accounts", column: "account_id"
  add_foreign_key "tasks", "checklists"
end
