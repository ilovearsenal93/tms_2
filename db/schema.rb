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

ActiveRecord::Schema.define(version: 20140725043622) do

  create_table "activities", force: true do |t|
    t.integer  "object_id",   null: false
    t.string   "object_type", null: false
    t.string   "name",        null: false
    t.integer  "trainee_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_id"
    t.integer  "subject_id"
    t.integer  "task_id"
  end

  add_index "activities", ["object_id"], name: "index_activities_on_object_id"
  add_index "activities", ["object_type"], name: "index_activities_on_object_type"
  add_index "activities", ["trainee_id"], name: "index_activities_on_trainee_id"

  create_table "assigned_tasks", force: true do |t|
    t.integer  "trainee_subject_id"
    t.integer  "trainee_id"
    t.integer  "task_id"
    t.string   "status"
    t.datetime "timecomplete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_subjects", force: true do |t|
    t.integer  "subject_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: true do |t|
    t.string   "course_name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enrolls", force: true do |t|
    t.integer  "trainee_id"
    t.integer  "course_id"
    t.string   "status"
    t.datetime "timecomplete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "managing_courses", force: true do |t|
    t.integer  "trainee_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", force: true do |t|
    t.string   "subject_name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.text     "task_description"
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trainee_subjects", force: true do |t|
    t.integer  "enroll_id"
    t.integer  "trainee_id"
    t.integer  "subject_id"
    t.string   "status"
    t.datetime "timecomplete"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "start_date"
    t.date     "end_date"
  end

  create_table "trainees", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "supervisor",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "trainees", ["remember_token"], name: "index_trainees_on_remember_token"

end
