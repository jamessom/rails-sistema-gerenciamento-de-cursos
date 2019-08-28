# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_06_11_171327) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.date "date_birth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.datetime "date_enrollment"
    t.bigint "student_id"
    t.bigint "grade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grade_id"], name: "index_enrollments_on_grade_id"
    t.index ["student_id"], name: "index_enrollments_on_student_id"
  end

  create_table "grades", force: :cascade do |t|
    t.bigint "teacher_id"
    t.bigint "subject_id"
    t.datetime "initial_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_grades_on_subject_id"
    t.index ["teacher_id"], name: "index_grades_on_teacher_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "cpf"
    t.string "name"
    t.string "email"
    t.string "phone"
    t.date "date_birth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.string "requirement"
    t.integer "workload"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.integer "hour_value"
    t.string "certificates"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "employer_id"
    t.index ["employer_id"], name: "index_teachers_on_employer_id"
  end

  add_foreign_key "enrollments", "grades"
  add_foreign_key "enrollments", "students"
  add_foreign_key "grades", "subjects"
  add_foreign_key "grades", "teachers"
  add_foreign_key "teachers", "employers"
end
