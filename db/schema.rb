# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_10_26_225044) do
  create_table "vehicles", force: :cascade do |t|
    t.string "model"
    t.string "plate"
    t.string "brand"
    t.datetime "entry_date"
    t.datetime "exit_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "problem_description"
    t.integer "entry_km"
    t.integer "year"
    t.integer "exit_km"
    t.text "service_description"
  end

end
