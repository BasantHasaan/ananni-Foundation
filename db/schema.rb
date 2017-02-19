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

ActiveRecord::Schema.define(version: 20170218142321) do

  create_table "carpet_data", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "width"
    t.integer  "lenght"
    t.integer  "knot"
    t.integer  "code"
    t.string   "name"
    t.string   "main_model"
    t.string   "raw_material_name"
    t.integer  "raw_material_quantity"
    t.integer  "number_of_rows"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoice_payment_scheduels", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.decimal  "amount",     precision: 10
    t.date     "due_from"
    t.date     "due_after"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "invoices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "invoice_serial"
    t.date     "date"
    t.string   "customer"
    t.string   "item"
    t.integer  "quantity"
    t.integer  "unit_price"
    t.decimal  "discount",       precision: 10
    t.decimal  "tax",            precision: 10
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "job_orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "serial"
    t.date     "date"
    t.string   "item"
    t.integer  "workshop"
    t.integer  "loom"
    t.integer  "worker"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "looms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "reference"
    t.string   "workshop"
    t.integer  "workshop_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["workshop_id"], name: "index_looms_on_workshop_id", using: :btree
  end

  create_table "main_designes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "design_code"
    t.string   "name"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "purchase_requests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "pr_serial"
    t.date     "date"
    t.string   "item"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "raw_material_warehouses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "code"
    t.string   "item"
    t.text     "description",  limit: 65535
    t.integer  "uom"
    t.integer  "safety_level"
    t.string   "category"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "showrooms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "name",                        null: false
    t.string   "location",                    null: false
    t.text     "address",       limit: 65535, null: false
    t.string   "person_name",                 null: false
    t.string   "person_number",               null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "suppliers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "name"
    t.text     "address",      limit: 65535
    t.string   "phone"
    t.string   "person"
    t.string   "person_phone"
    t.string   "category"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "workers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.integer  "code"
    t.string   "name"
    t.text     "address",     limit: 65535
    t.string   "phone"
    t.string   "category"
    t.integer  "rate_unit"
    t.integer  "rate_amount"
    t.string   "fired"
    t.date     "firing_date"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "workshops", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "looms", "workshops"
end
