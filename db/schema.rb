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

ActiveRecord::Schema.define(version: 20170326045946) do

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.string   "requiriment"
    t.integer  "workload"
    t.decimal  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "enrrolments", force: :cascade do |t|
    t.datetime "date_enrrolment"
    t.integer  "Student_id"
    t.integer  "Team_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "enrrolments", ["Student_id"], name: "index_enrrolments_on_Student_id"
  add_index "enrrolments", ["Team_id"], name: "index_enrrolments_on_Team_id"

  create_table "students", force: :cascade do |t|
    t.string   "cpf"
    t.string   "email"
    t.string   "phone"
    t.date     "date_birth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.integer  "Trainer_id"
    t.integer  "Course_id"
    t.datetime "initial_date"
    t.datetime "end_date"
    t.integer  "workload"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "teams", ["Course_id"], name: "index_teams_on_Course_id"
  add_index "teams", ["Trainer_id"], name: "index_teams_on_Trainer_id"

  create_table "trainers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "hour_value"
    t.string   "certificates"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
