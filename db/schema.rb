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

ActiveRecord::Schema.define(version: 2019_06_11_162550) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "enrollments", force: :cascade do |t|
    t.datetime "date_enrollment"
    t.bigint "students_id"
    t.bigint "grades_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grades_id"], name: "index_enrollments_on_grades_id"
    t.index ["students_id"], name: "index_enrollments_on_students_id"
  end

  create_table "grades", force: :cascade do |t|
    t.bigint "trainers_id"
    t.bigint "subjects_id"
    t.datetime "initial_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subjects_id"], name: "index_grades_on_subjects_id"
    t.index ["trainers_id"], name: "index_grades_on_trainers_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "cpf"
    t.string "email"
    t.string "phone"
    t.date "date_birth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.string "requiriment"
    t.integer "workload"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trainers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "hour_value"
    t.string "certificates"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "enrollments", "grades", column: "grades_id"
  add_foreign_key "enrollments", "students", column: "students_id"
  add_foreign_key "grades", "subjects", column: "subjects_id"
  add_foreign_key "grades", "trainers", column: "trainers_id"
end
