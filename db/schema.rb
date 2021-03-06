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

ActiveRecord::Schema.define(version: 20190414193603) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "carts", force: :cascade do |t|
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.json     "items"
    t.float    "total"
    t.index ["customer_id"], name: "index_carts_on_customer_id", using: :btree
  end

  create_table "customers", force: :cascade do |t|
    t.string   "firstName",                           null: false
    t.string   "lastName",                            null: false
    t.string   "cpf",                                 null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "street"
    t.string   "number"
    t.string   "complement"
    t.string   "neighborhood"
    t.string   "city"
    t.string   "state"
    t.string   "postalCode"
    t.index ["email"], name: "index_customers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true, using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "customer_id"
    t.json     "customer"
    t.json     "address"
    t.json     "items"
    t.integer  "total_qty"
    t.float    "total_price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "photo"
    t.float    "price"
    t.integer  "stock"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "carts", "customers"
  add_foreign_key "orders", "customers"
end
