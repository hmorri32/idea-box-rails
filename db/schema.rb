ActiveRecord::Schema.define(version: 20171023194801) do
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ideas", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "quality",    default: 0
    t.datetime "created_at", null:    false
    t.datetime "updated_at", null: false
  end

end
