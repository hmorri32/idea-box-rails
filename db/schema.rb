ActiveRecord::Schema.define(version: 20171023203424) do
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "title"
  end

  create_table "ideas", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_ideas_on_category_id"
  end

  add_foreign_key "ideas", "categories"
end