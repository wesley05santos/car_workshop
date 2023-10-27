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
