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

ActiveRecord::Schema.define(version: 20150816000059) do

  create_table "item_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "simple_task_items", force: :cascade do |t|
    t.integer  "simple_task_id"
    t.integer  "user_id"
    t.integer  "stock_item_id"
    t.text     "note"
    t.integer  "qtd"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "simple_tasks", force: :cascade do |t|
    t.integer  "simple_work_id"
    t.string   "name"
    t.string   "description"
    t.boolean  "finished"
    t.datetime "finished_at"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "simple_works", force: :cascade do |t|
    t.string   "description"
    t.string   "notes"
    t.boolean  "finished"
    t.datetime "finished_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "stock_items", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.integer  "qtd"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "qtd_min",          default: 0
    t.integer  "item_category_id"
    t.float    "price",            default: 0.0
  end

  create_table "task_items", force: :cascade do |t|
    t.integer  "work_task_id"
    t.integer  "user_id"
    t.integer  "stock_item_id"
    t.text     "note"
    t.integer  "qtd"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "pin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "permission"
    t.boolean  "active"
  end

  create_table "vehicle_types", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "vehicle_type_id"
    t.string   "marca"
    t.string   "matricula"
    t.string   "corporacao"
  end

  create_table "work_tasks", force: :cascade do |t|
    t.integer  "ut"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "work_id"
    t.integer  "task_id"
    t.boolean  "finished"
    t.datetime "finished_at"
  end

  create_table "works", force: :cascade do |t|
    t.string   "description"
    t.text     "notes"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "finished"
    t.integer  "vehicle_id"
    t.datetime "finished_at"
  end

end
